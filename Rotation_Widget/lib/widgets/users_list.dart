import 'dart:math';

import 'package:flutter/material.dart';

import '../constant.dart';

class CircleUsersList extends StatelessWidget {
  final List<User> users;
  final bool isLeft;

  final double rotationAngle, height;
  const CircleUsersList(
      {Key? key,
      required this.users,
      required this.rotationAngle,
      required this.height,
      required this.isLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _angle = 2 * pi / users.length;
    final _circleRadius = height / 2;
    return Stack(alignment: Alignment.center, children: [
      ...List.generate(users.length, (index) {
        final _data = users[index];
        final _offset = Offset(_circleRadius * sin(index * _angle),
            _circleRadius * cos(index * _angle));
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2 + 25,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Transform.translate(
              offset: _offset,
              child: Transform.rotate(
                angle: isLeft ? -rotationAngle : rotationAngle,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(_data.image, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        );
      })
    ]);
  }
}
