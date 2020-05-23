import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorChangeLogic extends InheritedWidget {
  final Widget child;
  final ColorChange color;

  ColorChangeLogic({this.child, this.color});
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

  changeColor() {
    var random = new Random();
    var index = random.nextInt(9);
    displayColor = colors[index];
  }
}
