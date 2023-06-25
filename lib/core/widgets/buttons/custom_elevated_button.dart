import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool filled;
  final String? title;
  final Widget? child;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const CustomElevatedButton({
    super.key,
    this.filled = true,
    this.title,
    this.width,
    this.height,
    this.child,
    this.backgroundColor,
    required this.onPressed,
  }) : assert(title != null || child != null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 52.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: child ??
            Text(
              title!,
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
      ),
    );
  }
}
