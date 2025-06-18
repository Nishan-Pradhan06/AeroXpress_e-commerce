import 'package:deal_sell/core/helpers/input_validator_helper.dart';
import 'package:deal_sell/core/theme/app_colors.dart';
import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_images.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _password;

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
                          hintText: 'Full Name',
                          validator:
                              (value) =>
                                  value == null || value.trim().isEmpty
                                      ? 'Name is required'
                                      : null,
                          onSaved: (name) {
                            // Save name
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Phone',
                          keyboardType: TextInputType.phone,
                          validator: InputValidator.validatePhone,
                          onSaved: (phone) {
                            // Save phone
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Password',
                          obscureText: true,
                          validator: (password) {
                            _password = password;
                            return InputValidator.validatePassword(password);
                          },
                          onSaved: (password) {
                            // Save password
                          },
                        ),
                        CustomTextFormField(
                          hintText: 'Confirm Password',
                          obscureText: true,
                          validator: (confirmPassword) {
                            if (confirmPassword != _password) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          onSaved: (confirmPassword) {
                            // Save confirmPassword
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Handle registration logic
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: brandPrimaryColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign up"),
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
