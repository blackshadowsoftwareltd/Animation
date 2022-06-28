import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double initX = 0.0, initY = 0.0;
  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen(
      (GyroscopeEvent event) {
        if (event.y.abs() > 0.0) {
          initX = initX + (event.y * 2);
        }
        if (event.x.abs() > 0.0) {
          initY = initY + (event.x * 2);
        }

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<GyroscopeEvent>(
        stream: SensorsPlatform.instance.gyroscopeEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.y.abs() > 0.0) {
              initX = initX + (snapshot.data!.y * 2);
            }
            if (snapshot.data!.x.abs() > 0.0) {
              initY = initY + (snapshot.data!.x * 2);
            }
          }

          return Stack(
            children: [
              Positioned(
                  left: -20 - initX,
                  right: -20 + initX,
                  top: -20 - initY,
                  bottom: -20 + initY,
                  child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1536223018115-f34afa40e19d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
                          fit: BoxFit.cover))),
            ],
          );
        },
      ),
    );
  }
}
