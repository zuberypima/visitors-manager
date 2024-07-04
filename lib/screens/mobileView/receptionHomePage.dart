import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/callScreen.dart';
import 'package:visitors/screens/adminHomeScreen.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Receptionhomepage extends StatefulWidget {
  const Receptionhomepage({super.key});

  @override
  State<Receptionhomepage> createState() => _ReceptionhomepageState();
}

class _ReceptionhomepageState extends State<Receptionhomepage> {
  int _selectedScreen = 1;
  List<Widget> screenList = [
    MobileVisitorsView(),
    AdminMainScreen(),
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
            BottomNavigationBarItem(icon: Icon(Icons.group), label: "Visitors"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_sharp), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // normalCallPage();
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CallPage(callID: '123456')));
        },
        child: Icon(Icons.call),
      ),
    );
  }
}
