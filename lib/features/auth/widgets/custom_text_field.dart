import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController?controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0 * 1.5,
          vertical: 16.0,
        ),
      ),
    );
  }
}
