import 'package:flutter/material.dart';

class TotalAmount extends ChangeNotifier {
  int _totalAmount = 0;

  get totalAmount => _totalAmount;

  void increaseAmount(int val) {
    _totalAmount += val;
    notifyListeners();
  }

  void decreaseAmount(int val) {
    _totalAmount -= val;
    notifyListeners();
  }
}
