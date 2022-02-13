import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProAnimatedBlur extends ImplicitlyAnimatedWidget {
  const ProAnimatedBlur({
    Key? key,
    required this.blur,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  final double blur;
  final Widget? child;

  @override
  AnimatedWidgetBaseState<ProAnimatedBlur> createState() =>
      _AnimatedBlurState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<double>('blur', blur));
  }
}

class _AnimatedBlurState extends AnimatedWidgetBaseState<ProAnimatedBlur> {
  Tween<double>? _blurTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _blurTween = visitor(_blurTween, widget.blur,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: _blurTween?.evaluate(animation) ?? 0,
        sigmaY: _blurTween?.evaluate(animation) ?? 0,
      ),
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween<double>>('blur', _blurTween,
        defaultValue: null));
  }
}
