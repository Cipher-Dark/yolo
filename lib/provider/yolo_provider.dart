import 'package:flutter/material.dart';

class YoloProvider extends ChangeNotifier {
  bool _hideCard = true;
  bool _hideCvv = true;

  bool get getHideCard => _hideCard;
  bool get getHideCvv => _hideCvv;

  void setHideCard() {
    _hideCard = !_hideCard;
    notifyListeners();
  }

  void setHideCvv() {
    _hideCvv = !_hideCvv;
    notifyListeners();
  }
}
