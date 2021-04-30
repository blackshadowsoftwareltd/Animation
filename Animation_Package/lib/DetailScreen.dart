import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'PreviewImage.dart';

class DetailScreen extends StatefulWidget {
  final String img1, img2, img3, dummyText;

  const DetailScreen({Key key, this.img1, this.img2, this.img3, this.dummyText})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String currentImg = '';
  bool isPreview = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailScreen')),
      body: PageTransitionSwitcher(
          reverse: !isPreview,
          duration: Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
                transitionType: SharedAxisTransitionType.scaled,
              ),
          child: isPreview
              ? ImgP(
                  context,
                  currentImg,
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      Img(context, widget.img1),
                      SizedBox(height: 5),
                      Text(widget.dummyText),
                      Img(context, widget.img2),
                      SizedBox(height: 5),
                      Text(widget.dummyText),
                      Img(context, widget.img3),
                    ],
                  ),
                )),
    );
  }

  Widget Img(BuildContext context, String img) => GestureDetector(
        onTap: () => setState(() {
          isPreview = !isPreview;
          currentImg = img;
        }),
        child: Container(
            height: 150,
            child: Image.network(
              img,
              fit: BoxFit.cover,
            )),
      );
  Widget ImgP(BuildContext context, String img) => GestureDetector(
        onTap: () => setState(() {
          isPreview = !isPreview;
          currentImg = img;
        }),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image.network(
              img,
              fit: BoxFit.cover,
            )),
      );
}
