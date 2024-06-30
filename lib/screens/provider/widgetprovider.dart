import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/beforAccesView/noAccessHome.dart';

class WidgetProvider extends ChangeNotifier {
// Identify the homepage according to the user.
  Widget _requiredHomePage = Noaccesshome();

  Widget get requiredHomePage => _requiredHomePage;

  void getSelectedHomePage(Widget homeWidget) {
    _requiredHomePage = homeWidget;
    notifyListeners();
  }
}
