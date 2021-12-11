import 'package:flutter/foundation.dart';

class AnimatController extends ChangeNotifier {
  bool buttonIsPressed = false;

  void setButtonPressed() {
    buttonIsPressed = !buttonIsPressed;
    notifyListeners();
  }
}
