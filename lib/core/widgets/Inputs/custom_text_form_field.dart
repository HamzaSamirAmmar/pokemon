import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool lastField;
  final bool obscure;
  final String label;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.lastField = false,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: lastField ? TextInputAction.done : TextInputAction.next,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      cursorColor: Theme.of(context).colorScheme.tertiary,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: TextStyle(
        color: Theme.of(context).colorScheme.tertiary,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFFB6B7B7),
        ),
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 19.h,
        ),
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
