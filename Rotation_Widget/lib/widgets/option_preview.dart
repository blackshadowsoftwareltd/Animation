import 'package:flutter/material.dart';

import '../constant.dart';
import 'animated_user_avaater.dart';

class OptionPreview extends StatefulWidget {
  const OptionPreview(
      {Key? key,
      required this.user,
      required this.isThumbUp,
      required this.heroKey,
      required this.animation})
      : super(key: key);
  final User user;
  final bool isThumbUp;
  final String heroKey;
  final Animation<double> animation;

  @override
  State<OptionPreview> createState() => _OptionPreviewState();
}

class _OptionPreviewState extends State<OptionPreview>
    with SingleTickerProviderStateMixin {
  bool _showContent = false;
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 800), () => _showContent = true);
    setState(() {
      _animationController = AnimationController(
          vsync: this, duration: const Duration(seconds: 1));
      _animation = CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const _color = Colors.black87;
    final _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        setState(() => _showContent = false);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            FadeTransition(
              opacity: widget.animation,
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, _) {
                    return Transform.translate(
                      offset:
                          Offset(0, ((_size.height / 5) * _animation.value)),
                      child: Container(
                        decoration: const BoxDecoration(color: _color),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    child: IconButton(
                                        icon: const Icon(Icons.arrow_back_ios,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() => _showContent = false);
                                          Navigator.of(context).pop();
                                        }))),

                            ///?
                            SizedBox(
                              height: 50 + _size.height * .65,
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: widget.heroKey,
                                    child: Container(
                                        height: _size.height * .65,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(40)))),
                                  ),
                                  AnimatedUserAvater(user: widget.user),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void onSend() {
    _animationController.reset();
    _animationController.forward();
  }
}
