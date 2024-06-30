import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/staffView/staffMenu.dart';
import 'package:visitors/screens/mobileView/staffView/staffVisitorView.dart';

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
    // Profilescreen()
  ];
  void onSelect(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: screenList.elementAt(_selectedScreen),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onSelect,
          currentIndex: _selectedScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.group), label: "My Visitors"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_sharp), label: "Home"),
            // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
