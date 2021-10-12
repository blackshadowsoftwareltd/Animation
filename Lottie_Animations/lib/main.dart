import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_animation.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animatation'),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                  onPressed: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              const CustomLottieAnimataionScreen())),
                  child: const Text('Custom Lottie Animataion Screen')),
              const Text('From network'),
              SizedBox(
                  height: 200,
                  child: Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_6s59yx.json',
                      animate: true,
                      repeat: true)),
              const Text('From local'),
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/finger_print.json',
                      animate: true, repeat: true)),
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/loading_animation.json',
                      animate: true, repeat: true)),
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/email.json',
                      animate: true, repeat: true)),
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/shimmer.json',
                      animate: true, repeat: true)),
              SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/jump_through.json',
                      animate: true, repeat: true)),
            ],
          ),
        ),
      ),
    );
  }
}
