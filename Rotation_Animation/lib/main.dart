import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int value = 0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 0).animate(controller);
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        /// controller will reversed the animation
        await Future.delayed(Duration(seconds: 2), () => controller.reverse());
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rotation Animation')),
        body: Center(
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) =>
                    Transform.rotate(angle: animation.value, child: child),
                child: Icon(Icons.image,
                    color: Colors.green.shade300, size: 100))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.rotate_right),
            onPressed: () {
              setRotation(value + 90);
              controller.forward(from: 0);
            }));
  }

  void setRotation(int degree) {
    final angle = degree * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }
}
