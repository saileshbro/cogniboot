import 'package:flutter/material.dart';

import 'logicPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inherited Widget Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
        child: MainBody(),
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
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  const MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  ColorChangeLogic colorChangeLogic;

  void _changeColor() {
    setState(() {
      colorChangeLogic.color.changeColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    colorChangeLogic = ColorChangeLogic.of(context);
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: colorChangeLogic.color.displayColor,
              height: 100,
              width: 100,
            ),
            SizedBox(
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
      ),
    );
  }
}
