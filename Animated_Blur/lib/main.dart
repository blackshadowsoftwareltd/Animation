// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

import 'animate.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isBlurred = false;
  double _maxBlurAmount = 8, _minBlurAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1515091943-9d5c0ad475af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
                          fit: BoxFit.cover)),

                  ///
                  Container(

                      /// must need this decoration and clipBehavior. otherwise, it not will work.
                      decoration: const BoxDecoration(color: Colors.black),
                      clipBehavior: Clip.antiAlias,
                      height: 300,
                      width: 200,
                      child: Stack(children: [
                        ///
                        SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                                'https://images.unsplash.com/photo-1528862973381-9bc5ad6d4227?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                                fit: BoxFit.cover)),

                        ///
                        Center(
                            child: ProAnimatedBlur(
                                blur: _isBlurred
                                    ? _maxBlurAmount
                                    : _minBlurAmount,
                                duration: const Duration(seconds: 1),
                                curve: Curves.linear,
                                child: const SizedBox()))
                      ]))
                ]))),

        ///
        floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
                  _isBlurred = !_isBlurred;
                  setState(() {});
                })));
  }
}
