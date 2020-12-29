import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(MaterialApp(
      home: AnimatedSplashScreen(),
      debugShowCheckedModeBanner: false,
    ));

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  bool _value = false;
@override
  void initState() {
    // TODO: implement initState
  Timer(Duration(seconds: 5), (){
    Navigator.push(context, CupertinoPageRoute(builder: (context)=>Home()));
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _value == false ? _file() : _resizingHouse(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        onPressed: () {
          setState(() {
            _value = !_value;
          });
        },
      ),
    );
  }

  Widget _file() {
    return Container(
        child: FlareActor(
      'animation/file.flr',
      alignment: Alignment.center,
      fit: BoxFit.cover,
      animation: 'peace',
    ));
  }

  Widget _resizingHouse() {
    return Container(
        child: FlareActor(
      'animation/Resizing House.flr',
      alignment: Alignment.center,
      fit: BoxFit.cover,
      animation: 'Demo Mode',
    ));
  }
}
