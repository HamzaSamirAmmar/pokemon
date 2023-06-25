import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final bool filled;
  final String? title;
  final Widget? child;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const CustomTextButton({
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
      height: height ?? 57.h,
      width: width ?? 307.w,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ??
              (filled
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.background),
          shape: filled
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1,
                  ),
                ),
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              title!,
              style: TextStyle(
                fontSize: 16.sp,
                color: filled
                    ? Colors.white
                    : Theme.of(context).textTheme.headline1!.color,
                // fontWeight: FontWeight.w300
              ),
            ),
      ),
    );
  }
}
