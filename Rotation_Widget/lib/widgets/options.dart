import 'package:flutter/material.dart';

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
              setState(() => _isTargeted = false);
            },
            onMove: ((data) => setState(() => _isTargeted = true)),
            onLeave: ((_) => setState(() => _isTargeted = false)),
            builder: (BuildContext context, List<Object?> candidateData,
                List<dynamic> rejectedData) {
              return Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: SizedBox(
                      height: 130,
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
                          ])));
            }));
  }
}
