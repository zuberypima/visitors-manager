import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/menuScreen.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedScreen = 1;
  List<Widget> screenList = [
    MobileVisitorsView(),
    MainMenuScreen(),
    Profilescreen()
  ];
  void onSelect(int index) {
    setState(() {
      _selectedScreen=index;
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
            icon: Icon(Icons.home_max_sharp), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
      ]),
    );
  }
}
