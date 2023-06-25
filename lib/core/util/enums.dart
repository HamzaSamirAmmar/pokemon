import 'package:flutter/material.dart';

enum Shape { circle, square, roundedSquare }

extension ShapeHelpers on Shape {
  Color shapeColor(BuildContext context) {
    switch (this) {
      case Shape.circle:
        return Colors.redAccent;
      case Shape.square:
        return Theme.of(context).colorScheme.secondary;
      case Shape.roundedSquare:
        return Theme.of(context).colorScheme.primary;
      default:
        return Theme.of(context)
            .colorScheme
            .primary; // because the initial is default square
    }
  }

  ShapeBorder toShapeBorder() {
    switch (this) {
      case Shape.circle:
        return const CircleBorder();
      case Shape.square:
        return const RoundedRectangleBorder();
      case Shape.roundedSquare:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        );
      default:
        return const RoundedRectangleBorder(); // because the initial is default square
    }
  }
}
