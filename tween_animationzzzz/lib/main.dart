import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController sizeAnimationController;
  late Animation _sizeAnimtaion;
  @override
  void initState() {
    super.initState();
    final _height = 500.0;
    final _width = 500.0;
    sizeAnimationController =
        AnimationController(vsync: this, duration: _duration);
    _sizeAnimtaion =
        Tween<double>(begin: 50, end: _height).animate(sizeAnimationController);
    sizeAnimationController.addListener(() {
      setState(() {});
    });
  }

  final _duration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
          width: _width,
          height: _height,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.animation),
            onPressed: () {
              sizeAnimationController.forward();
            }));
  }
}
