import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClearTextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearTextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          SizedBox(width: 10.w),
          Text(
            "Clear text",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
