import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  // Selected departmetn
  int _today_visitor = 0;

  int get today_visitor => _today_visitor;

  void get_today_visitors(int vistors) {
    _today_visitor = vistors;
    print(vistors);
    notifyListeners();
  }
}
