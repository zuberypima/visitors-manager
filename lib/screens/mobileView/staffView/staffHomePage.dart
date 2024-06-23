import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/callScreen.dart';
import 'package:visitors/screens/mobileView/menuScreen.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/staffView/staffMenu.dart';
import 'package:visitors/screens/mobileView/staffView/staffVisitorView.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class StaffHomeView extends StatefulWidget {
  const StaffHomeView({super.key});

  @override
  State<StaffHomeView> createState() => _StaffHomeViewState();
}

class _StaffHomeViewState extends State<StaffHomeView> {
  int _selectedScreen = 1;
  List<Widget> screenList = [
    Staffvisitorview(),
    StaffMainMenuScreen(),
    Profilescreen()
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
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "My Visitors"),
             BottomNavigationBarItem(
                 icon: Icon(Icons.home_max_sharp), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
     
    );
  }
}


