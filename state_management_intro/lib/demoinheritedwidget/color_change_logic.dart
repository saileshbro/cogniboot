import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangeLogic extends InheritedWidget {
  final Widget child;
  final ColorChange color;

  const ColorChangeLogic({this.child, this.color});
  static ColorChangeLogic of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorChangeLogic>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class ColorChange {
  List<Color> colors;
  Color displayColor;
  ColorChange(
    this.colors,
    this.displayColor,
  );

  void changeColor() {
    final random = Random();
    final index = random.nextInt(9);
    displayColor = colors[index];
  }
}
