import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'users_list.dart';

class RotationgDotedCircle extends StatefulWidget {
  final double height;
  final bool isLeft;
  final List<User> users;

  const RotationgDotedCircle(
      {Key? key,
      required this.height,
      required this.isLeft,
      required this.users})
      : super(key: key);

  @override
  State<RotationgDotedCircle> createState() => _RotationgDotedCircleState();
}

class _RotationgDotedCircleState extends State<RotationgDotedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController rotationController;
  late Animation rotationAnimation;
  @override
  void initState() {
    super.initState();
    rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    rotationAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(rotationController);
    rotationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    super.dispose();
    rotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: rotationAnimation,
        builder: (_, child) {
          final _angle = widget.isLeft
              ? rotationAnimation.value
              : -rotationAnimation.value;
          return Transform.rotate(
              angle: _angle,
              child: Stack(alignment: Alignment.center, children: [
                ///! Doted border
                child!,

                ///! CirculeUsersList
                CircleUsersList(
                    isLeft: widget.isLeft,
                    height: widget.height,
                    users: widget.users,
                    rotationAngle: rotationAnimation.value)
              ]));
        },
        child: IgnorePointer(child: DottedCircle(height: widget.height)));
  }
}

class DottedCircle extends StatelessWidget {
  final double height;

  const DottedCircle({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black,
      borderType: BorderType.Circle,
      strokeWidth: 1,
      dashPattern: const [5, 5],
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
