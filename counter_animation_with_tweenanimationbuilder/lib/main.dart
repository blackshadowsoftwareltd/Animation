import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int newNum = 0;
  int? oldNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter Animation')),
        body: Center(
            child: TweenAnimationBuilder<double>(
                key: Key(newNum.toString()),
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 300),
                builder: (_, double value, __) {
                  return Stack(children: [
                    if (oldNum != null)
                      Transform.translate(
                          offset: Offset(0, 50 * value),
                          child: Opacity(
                              opacity: -value + 1,
                              child: Text(oldNum.toString(), style: style))),
                    Transform.translate(
                        offset: Offset(0, -50 * (1 - value)),
                        child: Opacity(
                            opacity: value,
                            child: Text(newNum.toString(), style: style)))
                  ]);
                })),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              oldNum = newNum;
              newNum++;
              setState(() {});
            },
            child: const Icon(Icons.add)));
  }
}

const style = TextStyle(fontSize: 40);
