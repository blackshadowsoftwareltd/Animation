import 'package:animationzz/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AnimatController _controller = AnimatController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return Scaffold(
            body: LayoutBuilder(builder: (context, contraints) {
              return Center(
                child: GestureDetector(
                  onTap: _controller.setButtonPressed,
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    switchInCurve: Curves.easeInOutBack,
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: _controller.buttonIsPressed
                        ? Container(
                            key: const ValueKey('unPressed'),
                            padding: const EdgeInsets.all(5),
                            decoration: decorationz,
                            child: Icon(
                              Icons.snowboarding,
                              size: 40,
                              color: Colors.grey.shade500,
                            ),
                          )
                        : Container(
                            key: const ValueKey('pressed'),
                            padding: const EdgeInsets.all(5),
                            decoration: decorationz,
                            child: Icon(
                              Icons.ac_unit,
                              size: 40,
                              color: Colors.grey.shade800,
                            ),
                          ),
                  ),
                ),
              );
            }),
          );
        });
  }

  final decorationz = BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(50));
}
