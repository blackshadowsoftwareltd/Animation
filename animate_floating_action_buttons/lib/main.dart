// import 'dart:ui';

// import 'package:flutter/material.dart';

// void main() => runApp(const MaterialApp(home: Home()));

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   late bool _isExpanded;
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200));
//     _animation = Tween<double>(begin: 0, end: 50).animate(_animationController);
//     _isExpanded = false;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _animationController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(),

//         ///? background components
//         body: SizedBox(
//             width: size.width,
//             height: size.height,
//             child: Image.network(
//                 'https://images.unsplash.com/photo-1654805540365-f5f7c81dfadf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
//                 fit: BoxFit.cover)),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: AnimatedBuilder(
//             animation: _animation,
//             builder: (_, child) {
//               ///? value for background blur & button elevation
//               final value = _animation.value * .1;

//               ///? oppacity for button oppacity
//               final oppacity = _animation.value * .02;

//               return Stack(children: [
//                 ///? background for blur & isExpande = false
//                 if (_isExpanded)
//                   BackdropFilter(
//                       filter: ImageFilter.blur(
//                           sigmaX: value * 2, sigmaY: value * 2),
//                       child: GestureDetector(
//                           onTap: animateNow,
//                           child: Container(
//                               color: Colors.transparent,
//                               width: size.width,
//                               height: size.height))),

//                 ///? Floating Action Buttons
//                 Positioned(
//                     right: 20,
//                     bottom: (_animation.value * 4) + 20,
//                     child: Opacity(
//                       opacity: oppacity,
//                       child: FloatingActionButton.small(
//                           elevation: value,
//                           onPressed: () {},
//                           backgroundColor: Colors.blueGrey.shade800,
//                           child: const Text('5')),
//                     )),
//                 Positioned(
//                     right: 20,
//                     bottom: (_animation.value * 3) + 20,
//                     child: Opacity(
//                       opacity: oppacity,
//                       child: FloatingActionButton.small(
//                           elevation: value,
//                           onPressed: () {},
//                           backgroundColor: Colors.blueGrey.shade700,
//                           child: const Text('4')),
//                     )),
//                 Positioned(
//                     right: 20,
//                     bottom: (_animation.value * 2) + 20,
//                     child: Opacity(
//                       opacity: oppacity,
//                       child: FloatingActionButton.small(
//                           elevation: value,
//                           onPressed: () {},
//                           backgroundColor: Colors.blueGrey.shade600,
//                           child: const Text('3')),
//                     )),
//                 Positioned(
//                     right: 20,
//                     bottom: (_animation.value) + 20,
//                     child: Opacity(
//                       opacity: oppacity,
//                       child: FloatingActionButton.small(
//                           elevation: value,
//                           onPressed: () {},
//                           backgroundColor: Colors.blueGrey.shade500,
//                           child: const Text('2')),
//                     )),
//                 Positioned(
//                     right: 20,
//                     bottom: 20,
//                     child: FloatingActionButton.small(
//                         onPressed: animateNow,
//                         backgroundColor: Colors.blueGrey.shade400,
//                         child: Text(
//                             _animationController.isCompleted ? 'X' : '1'))),
//               ]);
//             }));
//   }

//   void animateNow() {
//     if (_animationController.isCompleted) {
//       _animationController.reverse().then((value) => _isExpanded = false);
//     } else {
//       _isExpanded = true;
//       _animationController.forward();
//     }
//   }
// }
