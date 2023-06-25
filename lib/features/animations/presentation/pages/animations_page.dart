import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/enums.dart';

class AnimationsPage extends StatefulWidget {
  final String text;

  const AnimationsPage({
    super.key,
    required this.text,
  });

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  Shape _shape = Shape.square;

  final _duration = const Duration(milliseconds: 500);

  _triggerAnimation(Shape selectedShape) {
    if (_shape != selectedShape) {
      setState(() {
        _shape = selectedShape;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40.h,
          horizontal: 30.w,
        ),
        child: Column(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 70.h),
            AnimatedContainer(
              duration: _duration,
              width: 375.w,
              height: 300.w,
              decoration: ShapeDecoration(
                shape: _shape.toShapeBorder(),
                color: _shape.shapeColor(context),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      _triggerAnimation(Shape.square);
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _triggerAnimation(Shape.roundedSquare);
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _triggerAnimation(Shape.circle);
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
