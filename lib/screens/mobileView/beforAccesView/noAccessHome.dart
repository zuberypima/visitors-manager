import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/beforAccesView/noAccessVisitors.dart';
import 'package:visitors/screens/mobileView/callScreen.dart';
import 'package:visitors/screens/mobileView/menuScreen.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Noaccesshome extends StatefulWidget {
  const Noaccesshome({super.key});

  @override
  State<Noaccesshome> createState() => _NoaccesshomeState();
}

class _NoaccesshomeState extends State<Noaccesshome> {
  int _selectedScreen = 1;
  List<Widget> screenList = [
    NoAcceVisitorsView(),
    NoAcceVisitorsView(),
    NoAcceVisitorsView()
  ];
  void onSelect(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(_selectedScreen),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onSelect,
          currentIndex: _selectedScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Visitors"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_sharp), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
