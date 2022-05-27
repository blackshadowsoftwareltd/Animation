import 'package:flutter/material.dart';
import 'package:rotation_widget/constant.dart';

class DraggableWidget extends StatefulWidget {
  final bool isLeft;
  final User user;
  final double angle;
  const DraggableWidget(
      {Key? key, required this.isLeft, required this.user, required this.angle})
      : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
  late Offset _offset;
  late AnimationController _draggablePositionController;
  late Animation _draggableAnimation;
  @override
  void initState() {
    super.initState();
    _offset = Offset.zero;
    _draggablePositionController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _draggablePositionController.addListener(() {
      setState(() {
        _offset = _draggableAnimation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Draggable<User>(
      onDragUpdate: (details) => setState(() => _offset += details.delta),
      onDragEnd: (details) => takeUserWidgetBackToItsPosition(),
      onDraggableCanceled: (velocity, offset) {},
      feedback: UserImage(user: widget.user).scale(1.1),
      childWhenDragging: const SizedBox(),
      child: UserImage(user: widget.user),
    );
  }

  void takeUserWidgetBackToItsPosition() {
    Offset _begainFrom = _offset;
    _draggableAnimation = Tween<Offset>(begin: _begainFrom, end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _draggablePositionController, curve: Curves.fastOutSlowIn));
    _draggablePositionController.reset();
    _draggablePositionController.forward();
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

extension GD on Widget {
  Widget scale(double scale) => Transform.scale(
        scale: scale,
        child: this,
      );
}
