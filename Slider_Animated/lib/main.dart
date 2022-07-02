import 'package:flutter/material.dart';

import 'indicator.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected = 0;
  @override
  void initState() {
    super.initState();
    autoAnimate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: const Text('Slider Animated')),
        body: Column(children: [
          SizedBox(
              height: 200,
              child: PageView.builder(
                  controller: controller,
                  itemCount: data.length,
                  onPageChanged: (value) => setState(() => selected = value),
                  itemBuilder: ((context, index) {
                    final scale = selected == index ? 1.0 : 0.9;

                    ///? Sliders
                    return TweenAnimationBuilder(
                        duration: duration,
                        curve: curve,
                        tween: Tween<double>(begin: scale, end: scale),
                        builder: (_, double value, __) {
                          return Transform.scale(
                              scale: value,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                          width: size.width,
                                          child: Image.network(data[index],
                                              fit: BoxFit.cover)))));
                        });
                  }))),

          ///? Indicators
          Indicatiors(selectedIndex: selected)
        ]));
  }

  Future<void> autoAnimate() async {
    for (var x in data) {
      await Future.delayed(const Duration(seconds: 2));
      controller.animateToPage(data.indexOf(x),
          duration: duration, curve: curve);
    }
    await autoAnimate();
  }
}

const curve = Curves.linear;
const duration = Duration(seconds: 1);
PageController controller =
    PageController(initialPage: 0, viewportFraction: .65);
final data = [
  'https://images.unsplash.com/photo-1656316385620-b8be53335afa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=411&q=80',
  'https://images.unsplash.com/photo-1656308918259-8ce8f38f0442?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=381&q=80',
  'https://images.unsplash.com/photo-1653122025256-d1ac2880c511?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
  'https://images.unsplash.com/photo-1653286017116-045b1fc807b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80'
];
