import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: DelayedDisplay(
                delay: Duration(seconds: 1),
                fadingDuration: Duration(seconds: 2),
                slidingBeginOffset: Offset(1, 0),
                child: Text("Delayed Display Animation")),

            ///
            leading: DelayedDisplay(
                delay: Duration(seconds: 1),
                fadingDuration: Duration(milliseconds: 500),
                slidingBeginOffset: Offset(1, 0),
                child: Icon(Icons.arrow_back_ios))),

        ///
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => DelayedDisplay(
                delay: Duration(milliseconds: index * 350),
                fadingDuration: Duration(milliseconds: 1000),
                slidingBeginOffset: Offset(0, 1),
                child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.green.shade200,
                    child: Text("Delayed Display Animation")))),

        ///
        floatingActionButton: DelayedDisplay(
            delay: Duration(seconds: 4),
            fadingDuration: Duration(milliseconds: 2000),
            slidingBeginOffset: Offset(-1, -1),
            child: FloatingActionButton(
                onPressed: () {}, child: Icon(Icons.animation))));
  }
}
