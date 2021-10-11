import 'package:flutter/material.dart';
import 'dart:math' as m;

class AnimatedzButton extends StatefulWidget {
  final VoidCallback? onComplete;

  const AnimatedzButton({Key? key, this.onComplete}) : super(key: key);

  @override
  _AnimatedzButtonState createState() => _AnimatedzButtonState();
}

class _AnimatedzButtonState extends State<AnimatedzButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onComplete?.call();
          controller.reset();
        }
      });
  }

  ///
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.4,
        child: ClipRRect(
          child: GestureDetector(
              onLongPressStart: _onLongPressStart,
              onLongPressEnd: _onLongPressEnd,
              child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, snapshot) {
                    return CustomPaint(
                        painter: ArcShapePainter(
                            progress: animation.value,
                            radius: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            strokeWidth: 6),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(Icons.touch_app_outlined,
                                  size: 30, color: Colors.white),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Long press',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)))
                            ]));
                  })),
        ));
  }

  void _onLongPressStart(LongPressStartDetails details) {
    controller.reset();
    controller.forward();
  }

  void _onLongPressEnd(LongPressEndDetails details) => controller.reset();
}

class ArcShapePainter extends CustomPainter {
  late double progress, radius, strokeWidth;
  late Color color;

  /// private
  late Paint _linePaint, _solidPaint;
  late Path _path;

  ///
  ArcShapePainter(
      {required this.color,
      this.progress = .5,
      this.radius = 400,
      this.strokeWidth = 4}) {
    _linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    ///
    _solidPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var cordLength = size.width + 4;
    if (radius < (cordLength * .5) + 16) radius = (cordLength * .5) + 16;
    if (radius > 600) radius = 600;

    ///
    var arcAngle = m.asin((cordLength * .5) / radius) * 2;
    var startAngle = (m.pi + m.pi * .5) - (arcAngle * .5);
    var progressAngle = arcAngle * progress;

    ///
    Offset center = Offset((cordLength * .5) - 2, radius + 8);

    /// line
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        progressAngle, false, _linePaint);

    /// body
    _path = Path();
    _path.arcTo(Rect.fromCircle(center: center, radius: radius), startAngle,
        arcAngle, true);
    _path.lineTo(size.width, size.height);
    _path.lineTo(0, size.height);
    _path.close();

    ///
    canvas.drawShadow(_path.shift(Offset(0, 1)), color.withAlpha(100), 3, true);

    ///
    canvas.drawPath(_path.shift(Offset(0, 12)), _solidPaint);
  }

  ///
  @override
  bool hitTest(Offset position) {
    return _path.contains(position);
  }

  ///

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
