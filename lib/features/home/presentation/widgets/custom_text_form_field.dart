import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 4.h),
        isDense: true,
        hintText: "Enter your name",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
