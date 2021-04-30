import 'package:animation_package/DetailScreen.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ListExample extends StatelessWidget {
  final String img1, img2, img3, dummyText;

  const ListExample({Key key, this.img1, this.img2, this.img3, this.dummyText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, index) {
        return OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (BuildContext _, VoidCallback openContainer) =>
              Container(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: Image.network(img1, width: 90, fit: BoxFit.cover),
              title: Text('Title $index'),
              onTap: openContainer,
            ),
          ),
          openBuilder: (BuildContext _, VoidCallback __) => DetailScreen(
            img1: img1,
            img3: img3,
            img2: img2,
            dummyText: dummyText,
          ),
          onClosed: (_) => print('Close'),
        );
      },
    );
  }
}
