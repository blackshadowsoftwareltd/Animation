import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

/// enum
enum ButtonState { init, loading, done }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false, isAnimating = true;
  ButtonState state = ButtonState.init;

  ///
  @override
  Widget build(BuildContext context) {
    ///
    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStretched = isAnimating || state == ButtonState.init;

    ///
    return Scaffold(
        appBar: AppBar(title: const Text('Loading Button')),
        body: SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 22),
                              minimumSize: const Size.fromHeight(50),
                              shape: const StadiumBorder()),
                          child: isLoading
                              ? const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                      color: Colors.white))
                              : const Text('Load'),
                          onPressed: () async {
                            setState(() => isLoading = !isLoading);
                            await Future.delayed(const Duration(seconds: 2));
                            setState(() => isLoading = !isLoading);
                          })),

                  /// Animated
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      width: state == ButtonState.init ? width * .5 : 50,
                      height: 45,
                      onEnd: () => setState(() => isAnimating = !isAnimating),
                      child: isStretched ? loadButton() : progresser(isDone))
                ])));
  }

  Container progresser(bool isDone) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? Colors.green : Colors.blue.shade900),
        alignment: Alignment.center,
        child: SizedBox(
            height: 30,
            width: 30,
            child: isDone
                ? const Icon(Icons.check, color: Colors.white)
                : const CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2)));
  }

  Widget loadButton() {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
            side: BorderSide(width: 2, color: Colors.blue.shade900)),
        child: FittedBox(
            child: Text(' Load  ',
                style: TextStyle(color: Colors.blue.shade900, fontSize: 20))),
        onPressed: () async {
          setState(() => state = ButtonState.loading);
          await Future.delayed(const Duration(seconds: 3));
          setState(() => state = ButtonState.done);
          await Future.delayed(const Duration(seconds: 1));
          setState(() => state = ButtonState.init);
        });
  }
}
