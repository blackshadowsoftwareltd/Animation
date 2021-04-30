import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'DetailScreen.dart';

class GridExample extends StatelessWidget {
  final String img1, img2, img3, dummyText;

  const GridExample({Key key, this.img1, this.img2, this.img3, this.dummyText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 20,
      itemBuilder: (BuildContext context, index) {
        return OpenContainer(
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (BuildContext _, VoidCallback openContainer) =>
              Container(
            padding: const EdgeInsets.all(5),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      child: Image.network(img1, width: 90, fit: BoxFit.cover)),
                  SizedBox(height: 5),
                  Text('Title $index')
                ]),
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
