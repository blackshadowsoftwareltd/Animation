import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _img = ['assets/rocket.png', 'assets/rocket1.png'];
  int _selectedIndex = 0;

  ///
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();

    ///
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);

    ///
    _animation = Tween(begin: const Offset(0, 0), end: const Offset(0, .3))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// SlideTransition
                      SlideTransition(
                          position: _animation,
                          child: SizedBox(
                              width: 200,
                              height: 200,

                              /// AnimatedSwitcher
                              child: AnimatedSwitcher(
                                  duration: const Duration(seconds: 1),
                                  child: Image.asset(_img[_selectedIndex],
                                      key: ValueKey<int>(_selectedIndex))))),

                      ///
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              _img.length,
                              (index) => InkWell(
                                  onTap: () =>
                                      setState(() => _selectedIndex = index),
                                  child: Container(
                                      width: 70,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: index == _selectedIndex
                                              ? const Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 3))
                                              : null),
                                      child: Image.asset(_img[index])))))
                    ]))));
  }
}
