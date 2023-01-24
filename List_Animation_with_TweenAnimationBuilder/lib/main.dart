import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(listen);
  }

  void listen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter Animation')),
        body: CustomScrollView(
          controller: controller,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final itemPositionOffset = index * height;
                  final difference = controller.offset - itemPositionOffset;
                  final percent = 1 - (difference / height);
                  double scale = percent;
                  if (scale > 1.0) scale = 1.0;
                  if (scale < 0.0) scale = 0.0;
                  return Align(
                    heightFactor: .95,
                    child: Opacity(
                      opacity: scale,
                      child: Transform(
                        transform: Matrix4.identity()..scale(scale, 1),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: height,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.green.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('$index', style: style),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: 20,
              ),
            )
          ],
        ));
  }
}

final controller = ScrollController();
const height = 100.0;
const style = TextStyle(fontSize: 40);
