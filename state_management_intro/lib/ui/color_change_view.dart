import 'package:flutter/material.dart';
import 'package:state_management_intro/demoinheritedwidget/color_change_logic.dart';
import 'package:state_management_intro/widgets/color_display_widget.dart';

class ColorChangeView extends StatelessWidget {
  const ColorChangeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Cogniboot Color Changer",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: ColorChangeLogic(
        color: ColorChange(
          [
            Colors.blue,
            Colors.red,
            Colors.pink,
            Colors.purple,
            Colors.brown,
            Colors.black,
            Colors.green,
            Colors.deepOrange,
            Colors.indigo,
          ],
          Colors.red,
        ),
        child: const ColorDisplay(),
      ),
    );
  }
}
