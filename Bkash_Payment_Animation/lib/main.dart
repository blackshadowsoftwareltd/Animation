import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animated_button.dart';
import 'next_screens.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('B Kash Payment Animation')),
        body: SizedBox(
            width: double.infinity,
            child: Column(children: [
              const Expanded(child: SizedBox()),
              AnimatedzButton(onComplete: _onConfirmed)
            ])));
  }

  _onConfirmed() => Navigator.push(
      context, CupertinoPageRoute(builder: (context) => NextScreens()));
}
