import 'package:flutter/material.dart';
import 'package:rotation_widget/constant.dart';

class DraggableWidget extends StatelessWidget {
  final bool isLeft ;
  final User user;
  const DraggableWidget(
      {Key? key,
      required this.isLeft, 
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<User>(
      onDragUpdate: (details) {},
      onDragEnd: (details) {},
      onDraggableCanceled: (velocity, offset) {},
      feedback: UserImage(user: user),
      childWhenDragging: const SizedBox(),
      child: UserImage(user: user),
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.network(user.image, fit: BoxFit.cover),
      ),
    );
  }
}
