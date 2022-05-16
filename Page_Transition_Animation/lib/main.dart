import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Page Transition Animation'),
          backgroundColor: Colors.deepOrange,
        ),
        body: const Body(),
        floatingActionButton: const TransitionFloatingButton());
  }
}

///? floating button
class TransitionFloatingButton extends StatelessWidget {
  const TransitionFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _duration = Duration(seconds: 1);
    return InkWell(
        onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: _duration,
                reverseTransitionDuration: _duration,
                opaque: false,
                pageBuilder: (context, animation, _) => const SecondScreen())),

        ///?
        child: Hero(
            tag: 'secondScreen',
            child: Container(
              width: 150,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45,
                        blurRadius: 10,
                        spreadRadius: 3,
                        offset: Offset(5, 5))
                  ]),
              child: const Material(
                color: Colors.transparent,
                child: Text('Second Screen',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
            )));
  }
}

//? body of this screen
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (_, i) => Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.deepOrange.shade300,
            borderRadius: BorderRadius.circular(50)),
        child: Text(
          'Item $i',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
