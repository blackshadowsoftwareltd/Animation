import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Marquee(
      /// spase word to word
      blankSpace: 10,

      /// animation speed. -100 (-)for revers animation
      velocity: 100,

      /// pause for 2 second and then again start
      pauseAfterRound: Duration(seconds: 2),

      /// also support horizontal and vertical
      // scrollAxis: Axis.vertical,

      /// alignment
      crossAxisAlignment: CrossAxisAlignment.center,

      ///
      text:
          'Try running your application with "flutter run". You\'ll see the application has a blue toolbar. Then, without quitting the app, try changing the primarySwatch below to Colors.green and then invoke or simply save your changes to "hot reload" in a Flutter IDE). Notice that the counter didn\'t reset back to zero; the application',
      style: TextStyle(fontSize: 20),
    )));
  }
}
