import 'package:deal_sell/core/helpers/input_validator_helper.dart';
import 'package:deal_sell/core/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/app_images.dart';
import '../widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                    "Forgot Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          validator: InputValidator.validatePhone,
                          onSaved: (phone) {},
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // Trigger password reset process
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: brandPrimaryColor,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Send OTP"),
                        ),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: "Back to ",
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
