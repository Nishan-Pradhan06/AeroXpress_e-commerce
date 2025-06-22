import 'package:deal_sell/core/helpers/input_validator_helper.dart';
import 'package:deal_sell/core/theme/app_colors.dart';
import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:deal_sell/features/auth/blocs/user_sign_in/user_sign_in_bloc.dart';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/dl/dependency_injection.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_toast.dart';
import '../model/user_login_model.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
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
                    "Sign In",
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
                          hintText: 'Email',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: InputValidator.validateEmail,
                        ),

                        CustomTextFormField(
                          hintText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          validator: InputValidator.validatePassword,
                        ),
                        BlocConsumer<UserSignInBloc, UserSignInState>(
                          listener: (context, state) {
                            state.whenOrNull(
                              loaded: (data) {
                                context.pushNamed(AppRoutesName.bottomNavBar);
                              },
                              failure: (failure) {
                                CustomToast.showError(failure.message);
                              },
                            );
                          },
                          builder: (context, state) {
                            final bool isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );

                            return CustomButtonPrimary(
                              title: "Sign In",
                              isLoading: isLoading,

                              onPressed:
                                  isLoading
                                      ? null
                                      : () {
                                        if (_formKey.currentState!.validate()) {
                                          // log(_passwordController.text);
                                          sl<UserSignInBloc>().add(
                                            UserSignInEvent.userSiginIn(
                                              UserLoginModel(
                                                email: _emailController.text,
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

                        TextButton(
                          onPressed: () {
                            context.pushNamed(AppRoutesName.forgetPassword);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color!.withOpacity(0.64),
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.color!.withOpacity(0.64),
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: brandPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.dashed,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        context.pushNamed(
                                          AppRoutesName.registerScreen,
                                        );
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
