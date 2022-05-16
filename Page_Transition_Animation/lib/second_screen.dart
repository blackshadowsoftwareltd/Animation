import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'secondScreen',
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: const Text('Second Screen'),
                backgroundColor: Colors.deepOrange),
            body: Container(
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(5, 5))
            ]))));
  }
}
