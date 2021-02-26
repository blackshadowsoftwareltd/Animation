import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// double value = 0;

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final _heaght = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      _BackGroundDrower(context),
      _DrawerContent(context),
      TweenAnimationBuilder(
          tween: Tween<double>(begin: value, end: value),
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInExpo,
          builder: (_, double val, __) {
            return (Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 150 * val)
                  ..rotateY((pi / 6) * val),
                child: GestureDetector(

                    /// Swipe method
                    onHorizontalDragUpdate: (e) => setState(() {
                          if (e.delta.dx > 0)
                            value = 1;
                          else
                            value = 0;
                        }),
                    child: Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
                            leading: IconButton(
                                icon: Icon(
                                    value == 0
                                        ? Icons.arrow_forward_ios
                                        : Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 20),
                                onPressed: () => setState(() {
                                      value == 0 ? value = 1 : value = 0;
                                      print('pressed');
                                    })),
                            title: Text('3D Navigation Drawer')),
                        body: Container(
                            color: Colors.white,
                            child: Center(
                                child: Text('Home',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 20)))),
                        floatingActionButtonLocation:
                            FloatingActionButtonLocation.startFloat,
                        floatingActionButton: FloatingActionButton(
                            child: Icon(Icons.check_box_rounded, size: 25),
                            onPressed: () => print('pressed'))))));
          })
    ]));
  }

  Widget _BackGroundDrower(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[700], Colors.blue[400]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)));
  }

  _DrawerContent(BuildContext context) {
    final _heaght = MediaQuery.of(context).size.height / 2 - 20;
    return SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width - 120,
            padding: EdgeInsets.all(10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  // color: Colors.orange,
                  height: _heaght - 10,
                  width: 250,
                  alignment: Alignment.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: _heaght / 4,
                            child: Icon(Icons.person,
                                size: _heaght / 3, color: Colors.white)),
                        SizedBox(height: 20),
                        Text('Remon Ahammad',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700))
                      ])),
              Container(
                  // color: Colors.green,
                  height: _heaght,
                  child: ListView(children: [
                    ListTile(
                        leading:
                            Icon(Icons.home, size: 25, color: Colors.white),
                        title: Text('Home',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                    ListTile(
                        leading: Icon(Icons.people_alt,
                            size: 25, color: Colors.white),
                        title: Text('People',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                    ListTile(
                        leading: Icon(Icons.person_add_alt_1,
                            size: 25, color: Colors.white),
                        title: Text('Add Person',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)))
                  ]))
            ])));
  }
}
