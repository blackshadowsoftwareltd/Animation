import 'package:flutter/material.dart';
import 'package:rotation_widget/constant.dart';

import 'widgets/options.dart';
import 'widgets/rotating/rotationg_doted_circle.dart';

void main() => runApp(const MaterialApp(home: Home()));
GlobalKey revolvingWidgetKey = GlobalKey();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    const double _small = 80;
    return Scaffold(
        appBar: AppBar(title: const Text('AppBar')),
        body: Stack(key: revolvingWidgetKey, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TopOptions(
                        title: 'Thumb Up',
                        icon: Icons.thumb_up_alt_outlined,
                        isThumbUp: true),
                    TopOptions(
                        title: 'Thumb Down',
                        icon: Icons.thumb_down_outlined,
                        isThumbUp: false)
                  ])),

          ///?
          Align(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(0, _height / 4),
              child: Stack(alignment: Alignment.center, children: [
                RotationgDotedCircle(
                  height: _small * 5.6,
                  isLeft: false,
                  users: UserList.users,
                ),
                RotationgDotedCircle(
                  height: _small * 4.2,
                  isLeft: true,
                  users: UserList.users.sublist(2),
                ),
                RotationgDotedCircle(
                  height: _small * 2.8,
                  isLeft: false,
                  users: UserList.users.sublist(4),
                ),
                RotationgDotedCircle(
                  height: _small * 1.4,
                  isLeft: true,
                  users: UserList.users.sublist(5),
                ),
                const RotationgDotedCircle(
                  height: _small * .2,
                  isLeft: false,
                  users: [],
                ),
              ]),
            ),
          )
        ]));
  }
}
