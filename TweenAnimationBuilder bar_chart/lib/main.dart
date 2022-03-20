import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    List<Tile> _list = [];
    List.generate(5, (i) {
      int x = Random().nextInt(10);
      final value = 50.0 + 50 * x;
      final endColor = value < 200
          ? Colors.green.shade200
          : value < 350
              ? Colors.green.shade600
              : value < 450
                  ? Colors.green.shade900
                  : Colors.lightGreen;

      _list.add(Tile(
          max: value, startColor: Colors.green.shade100, endColor: endColor));
    }).toList();
    return Scaffold(
      body: SizedBox(
        height: _height,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _list
              .map(
                (e) =>

                    /// Container height
                    TweenAnimationBuilder<double?>(
                  tween: Tween<double>(begin: e.min, end: e.max),
                  duration: e.duration!,
                  builder: (_, value, __) => Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(e.max.toString()),

                      /// Conainer color
                      TweenAnimationBuilder<Color?>(
                        tween: ColorTween(begin: e.startColor, end: e.endColor),
                        duration: e.duration!,
                        builder: (_, Color? color, __) => Container(
                          width: 50,
                          height: value, // from TweenAnimationBuilder<double?>
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color:
                                  color ?? // from TweenAnimationBuilder<Color?>
                                      Colors.transparent),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class Tile {
  final double? min;
  final double max;
  final Color startColor, endColor;
  final Duration? duration;
  Tile({
    this.min = 0,
    required this.max,
    required this.startColor,
    required this.endColor,
    this.duration = const Duration(milliseconds: 1500),
  });
}
