import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Animated Crossfade',
      home: _AnimatedCrossFade(),
    ));

class _AnimatedCrossFade extends StatefulWidget {
  State<StatefulWidget> createState() {
    return AnmatedCrosFadeState();
  }
}

class AnmatedCrosFadeState extends State<_AnimatedCrossFade> {
  bool _currantState=true;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated CrossFade'),
      ),
      body: Container(
        child: AnimatedCrossFade(
          firstChild: Container(
            height: 200,
            color: Colors.green,
            child: Center(
                child: RaisedButton(
                  color: Colors.grey[700],
              child: Text('Next',style: TextStyle(color: Colors.white),),
                  onPressed: (){setState(() {
                    _currantState=false;
                  });},
            )
            ),
          ),
          secondChild: Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text('Wellcome'),
            ),
          ),
          duration: Duration(seconds: 1),
          crossFadeState: _currantState?CrossFadeState.showFirst:CrossFadeState.showSecond,
        ),
      ),
    );
  }
}
//
// class AnmatedCrosFadeState extends State<AnimatedCrosFade> {
//   bool _check = true;
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animated CrossFade'),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           AnimatedCrossFade(
//             firstChild:
//                 // Container(
//                 //   decoration: BoxDecoration(color: Colors.green),
//                 //   child: Center(
//                 //     child:
//                 RaisedButton(
//               child: Text('Button'),
//               onPressed: () {
//                 setState(() {
//                   _check = false;
//                 });
//               },
//             ),
//             secondChild: Center(
//               child: Text(
//                 'Wellcom',
//                 style: TextStyle(fontSize: 25),
//               ),
//             ),
//             duration: Duration(seconds: 1),
//             crossFadeState:
//                 _check ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//           ),
//         ],
//       )),
//     );
//   }
// }
