import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/receptionview/receptionMenu.dart';

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
        appBar: AppBar(),
        drawer: Drawer(
          child: Profilescreen(),
        ),
        body: screenList.elementAt(_selectedScreen),
        bottomNavigationBar: BottomNavigationBar(
            onTap: onSelect,
            currentIndex: _selectedScreen,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), label: "Visitors"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_sharp), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ]));
  }
}
