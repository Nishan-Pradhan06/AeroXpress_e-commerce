import 'dart:developer';

import 'package:deal_sell/core/helpers/input_validator_helper.dart';
import 'package:deal_sell/core/theme/app_colors.dart';
import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:deal_sell/features/auth/blocs/customer_sign_up/customer_sign_up_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/dl/dependency_injection.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_toast.dart';
import '../../../routes/app_route_names.dart';
import '../model/customer_register_model.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(AppImages.logo, height: 100),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: AppTheme.space4,
                      children: [
                        CustomTextFormField(
                          hintText: 'First Name',
                          controller: _firstNameController,
                          validator:
                              (value) =>
                                  value == null || value.trim().isEmpty
                                      ? 'First name is required'
                                      : null,
                          onSaved: (name) {
                            // Save name
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Last Name',
                          controller: _lastNameController,
                          validator:
                              (value) =>
                                  value == null || value.trim().isEmpty
                                      ? 'Last name is required'
                                      : null,
                          onSaved: (name) {
                            // Save name
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Phone',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: InputValidator.validatePhone,
                          onSaved: (phone) {
                            // Save phone
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Email Address',
                          controller: _emailController,
                          // obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          validator: InputValidator.validateEmail,
                        ),
                        CustomTextFormField(
                          hintText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          validator: (password) {
                            return InputValidator.validatePassword(password);
                          },
                        ),
                        BlocConsumer<CustomerSignUpBloc, CustomerSignUpState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              loaded: (data) {
                                CustomToast.showSuccess("Register Successful");
                                context.pushNamed(AppRoutesName.bottomNavBar);
                              },
                              failure: (failure) {
                                CustomToast.showError(failure.message);
                                log(failure.toString());
                                log('you are dumbbb');
                              },
                            );
                          },
                          builder: (context, state) {
                            final bool isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomButtonPrimary(
                              title: "Sign Up",
                              isLoading: isLoading,

                              onPressed:
                                  isLoading
                                      ? null
                                      : () {
                                        if (_formKey.currentState!.validate()) {
                                          log(_passwordController.text);
                                          sl<CustomerSignUpBloc>().add(
                                            CustomerSignUpEvent.customerSignUp(
                                              CustomerRegisterModel(
                                                email: _emailController.text,
                                                phone: _phoneController.text,
                                                firstName:
                                                    _firstNameController.text,
                                                lastName:
                                                    _lastNameController.text,
                                                password:
                                                    _passwordController.text,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                            );
                          },
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color!.withOpacity(0.64),
                            ),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: brandPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.dashed,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pop();
                                      },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
