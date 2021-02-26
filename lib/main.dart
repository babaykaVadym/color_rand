import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int R, G, B;
  Color backColor;
  String colorText, btnText;
  bool _click = true;

  getColor() {
    R = Random().nextInt(256);
    G = Random().nextInt(256);
    B = Random().nextInt(256);

    backColor = Color.fromARGB(255, R, G, B);
  }

  showText() {
    if (_click) {
      btnText = 'Show Colors';
      colorText = '';
    } else {
      btnText = 'Hide Colors Text';
      colorText = backColor.toString().toUpperCase();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getColor();
    showText();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    showText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Text(
            "Hey there",
            style: TextStyle(fontSize: 35),
          ),
          Positioned(
            bottom: 100,
            child: Text(
              colorText,
              //   textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 25),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                getColor();
              });
            },
          ),
          Positioned(
            bottom: 20,
            child: FlatButton(
              onPressed: () {
                if (_click) {
                  _click = false;
                } else {
                  _click = true;
                }
                setState(() {
                  showText();
                });
              },
              child: Text(
                btnText,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
