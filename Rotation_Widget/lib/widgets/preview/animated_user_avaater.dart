import 'package:flutter/material.dart';

import '../../constant.dart';

class AnimatedUserAvater extends StatelessWidget {
  const AnimatedUserAvater({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: SizedBox(
        height: 100,

        ///? Animation
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
          tween: Tween<double>(begin: 0, end: 1),
          builder: (_, double value, __) {
            final _radius = 8 * value + 40 * value * value;
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_radius),
                  child: SizedBox(
                      height: _radius * 2,
                      width: _radius * 2,
                      child: Image.network(user.image, fit: BoxFit.cover)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
