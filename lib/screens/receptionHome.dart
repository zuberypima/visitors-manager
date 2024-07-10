import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/receptionMenu.dart';

class Receptionhome extends StatefulWidget {
  const Receptionhome({super.key});

  @override
  State<Receptionhome> createState() => _ReceptionhomeState();
}

class _ReceptionhomeState extends State<Receptionhome> {
  int _selectedScreen = 1;
  List<Widget> screenList = [
    MobileVisitorsView(),
    ReceptionMainMenuScreen(),
  ];
  void onSelect(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Profilescreen(),
      ),
      body: ReceptionMainMenuScreen(),
    );
  }
}
