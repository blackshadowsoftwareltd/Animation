import 'package:flutter/material.dart';
import 'package:rotation_widget/widgets/option_preview.dart';

import '../constant.dart';

class TopOptions extends StatefulWidget {
  const TopOptions(
      {Key? key,
      required this.title,
      required this.icon,
      required this.isThumbUp})
      : super(key: key);
  final String title;
  final IconData icon;
  final bool isThumbUp;

  @override
  State<TopOptions> createState() => _TopOptionsState();
}

class _TopOptionsState extends State<TopOptions> {
  bool _isTargeted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: DragTarget<User>(
            onAccept: (User user) {
              print(user.name);
              print('is thumb up: ${widget.isThumbUp}');
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  pageBuilder: (context, animation, _) => OptionPreview(
                      user: user,
                      isThumbUp: widget.isThumbUp,
                      animation: animation,
                      heroKey: widget.title)));
              setState(() => _isTargeted = false);
            },
            onMove: ((data) => setState(() => _isTargeted = true)),
            onLeave: ((_) => setState(() => _isTargeted = false)),
            builder: (BuildContext context, List<Object?> candidateData,
                List<dynamic> rejectedData) {
              return Hero(
                tag: widget.title,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black45, width: .5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(2, 5))
                      ]),
                  child: SizedBox(
                      height: 120,
                      width: 180,
                      child: Column(
                          mainAxisAlignment: _isTargeted
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(widget.icon,
                                size: _isTargeted ? 40 : 30,
                                color: Colors.black54),
                            Text(widget.title,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold))
                          ])),
                ),
              );
            }));
  }
}
