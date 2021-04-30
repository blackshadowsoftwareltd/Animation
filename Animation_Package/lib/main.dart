import 'package:animation_package/GridExample.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'ListExample.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showList = true;
  bool _slowAnimations = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation Package'), actions: [
        IconButton(
            icon: Icon(Icons.switch_left_sharp, size: 30),
            onPressed: () => setState(() => _showList = !_showList))
      ]),
      body: PageTransitionSwitcher(duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: _showList
            ? ListExample(
                img1: img1,
                img2: img2,
                img3: img3,
                dummyText: dummyText,
              )
            : GridExample(
                img1: img1,
                img2: img2,
                img3: img3,
                dummyText: dummyText,
              ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(10),
        child: SwitchListTile(
          value: _slowAnimations,
          onChanged: (value) async {
            setState(() => _slowAnimations = value);

            /// wait until the switch is done animating before actually slowing
            ///  down time.
            if (_slowAnimations)
              await Future<void>.delayed(Duration(milliseconds: 200));
            timeDilation = _slowAnimations ? 3.0 : 1.0;
          },
          title: Text('Slow Animations'),
        ),
      ),
    );
  }

  String img1 =
      'https://images.pexels.com/photos/2469122/pexels-photo-2469122.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260';

  String img2 =
      'https://images.unsplash.com/photo-1618442928313-0b8afa050a57?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80';

  String img3 =
      'https://images.unsplash.com/photo-1597965408826-4589931942c9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

  String dummyText =
      'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?';
}
