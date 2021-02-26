import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          primaryColor: Colors.green,
          primaryColorLight: Colors.blue,
          accentColor: Colors.black,
          primaryColorDark: Colors.grey[700]),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'Animated Text';
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Text Size'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(fontSize: 20)),
            AnimatedDefaultTextStyle(
              style: isSelected
                  ? TextStyle(
                      fontSize: 40,
                      color: Colors.purple,
                      fontWeight: FontWeight.w900)
                  : TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w300,
                    ),
              duration: Duration(milliseconds: 500),
              child: Text(text),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}
