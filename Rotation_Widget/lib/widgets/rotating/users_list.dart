import 'dart:math';

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../dragable_widget.dart';

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
    for (var u in users) {
      final _i = users.indexOf(u);
      // _offsets.add(Offset(
      //     _circleRadius * sin(_i * _angle), _circleRadius * cos(_i * _angle)));
    }
    return Stack(alignment: Alignment.center, children: [
      ...List.generate(users.length, (index) {
        final _data = users[index];
        final _offset = (Offset(_circleRadius * sin(index * _angle),
            _circleRadius * cos(index * _angle)));

        return SizedBox(
          height: MediaQuery.of(context).size.height / 2 + 25,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Transform.translate(
              offset: _offset,
              child: Transform.rotate(
                angle: isLeft ? -rotationAngle : rotationAngle,
                child:
                    DraggableWidget(user: _data, isLeft: isLeft, angle: _angle),
              ),
            ),
          ),
        );
      })
    ]);
  }
}
