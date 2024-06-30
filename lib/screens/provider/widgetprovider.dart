import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/beforAccesView/noAccessHome.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/screens/servicesDashboard.dart';
import 'package:visitors/screens/toDayVisitors.dart';

class WidgetProvider extends ChangeNotifier {
  // Widget _selectedScreen = ServicesDashBoard();

  // Widget get selectedScreen => _selectedScreen;

  // void getSelectedWidget(Widget widget) {
  //   _selectedScreen = widget;
  //   notifyListeners();
  // }

// For Visitors Dashboard Page
  // Widget _selectedVisitors = AllTodayVisists();

  // Widget get selectedVisitors => _selectedVisitors;

  // void getSelectedVisitors(Widget widget) {
  //   _selectedVisitors = widget;
  //   notifyListeners();
  // }

// Identify the homepage according to the user.
  Widget _requiredHomePage = Noaccesshome();

  Widget get requiredHomePage => _requiredHomePage;

  void getSelectedHomePage(Widget homeWidget) {
    _requiredHomePage = homeWidget;
    notifyListeners();
  }
}
