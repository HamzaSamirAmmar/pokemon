import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final bool lastField;

  const PasswordTextFormField({
    super.key,
    this.hint = 'Password',
    required this.passwordController,
    this.validator,
    this.lastField = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      label: hint,
      lastField: lastField,
      controller: passwordController,
      obscure: true,
      validator: validator ??
          (password) {
            if (password == null || password.isEmpty) {
              return "$hint is required";
            }
            return null;
          },
    );
  }
}
