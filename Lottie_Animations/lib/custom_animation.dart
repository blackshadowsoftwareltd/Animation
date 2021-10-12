import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieAnimataionScreen extends StatefulWidget {
  const CustomLottieAnimataionScreen({Key? key}) : super(key: key);

  @override
  _CustomLottieAnimataionStateScreen createState() =>
      _CustomLottieAnimataionStateScreen();
}

class _CustomLottieAnimataionStateScreen
    extends State<CustomLottieAnimataionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isLoded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Animatation')),
      body: Center(
        child: TextButton(
          child: const Text('Show'),
          onPressed: showDoneDialog,
        ),
      ),
    );
  }

  void showDoneDialog() => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
            child: Lottie.asset('assets/finger_print.json',
                animate: true,
                repeat: false,
                controller: controller, onLoaded: (composition) {
              controller.duration = composition
                  .duration; // it will teke the original lottie duration

              controller.forward();
            }),
          ));
}
