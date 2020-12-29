import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Animated Container',
      home: _AnimatedContainer(),
    ));

class _AnimatedContainer extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AnimatedContainerState();
  }
}

class _AnimatedContainerState extends State<_AnimatedContainer> {
  bool _state = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Aontainer'),
      ),
      body: Center(
        child: AnimatedContainer(
            height: _state == false ? 200 : 400,
            width: _state == false ? 100 : 200,
            color: _state == false ? Colors.green : Colors.orange,
            duration: Duration(seconds: 1)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _state = !_state;
          });
        },
      ),
    );
  }
}
