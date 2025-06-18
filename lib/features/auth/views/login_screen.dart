import 'package:deal_sell/core/helpers/input_validator_helper.dart';
import 'package:deal_sell/core/theme/app_colors.dart';
import 'package:deal_sell/core/theme/app_theme.dart';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_images.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
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
                          validator: InputValidator.validatePassword,
                          onSaved: (password) {
                            // Save password
                          },
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.goNamed(AppRoutesName.bottomNavBar);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: brandPrimaryColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign in"),
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
                                        context.pushNamed(AppRoutesName.registerScreen);
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
