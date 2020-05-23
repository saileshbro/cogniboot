import 'package:flutter/material.dart';
import 'package:state_management_intro/demoinheritedwidget/color_change_logic.dart';

class ColorDisplay extends StatefulWidget {
  const ColorDisplay({Key key}) : super(key: key);

  @override
  _ColorDisplayState createState() => _ColorDisplayState();
}

class _ColorDisplayState extends State<ColorDisplay> {
  ColorChangeLogic colorChangeLogic;

  void _changeColor() {
    setState(() {
      colorChangeLogic.color.changeColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    colorChangeLogic = ColorChangeLogic.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: colorChangeLogic.color.displayColor,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 70,
          ),
          RaisedButton(
            onPressed: _changeColor,
            child: Text(
              "Change Color",
              style: TextStyle(
                fontSize: 23,
                color: colorChangeLogic.color.displayColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
