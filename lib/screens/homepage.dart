import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/callScreen.dart';
import 'package:visitors/screens/mobileView/menuScreen.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CallPage(callID: '123456')));
        },
        child: Icon(Icons.call),
      ),
    );
  }

//   Widget normalCallPage() {
//     print("Zego called");
//   return ZegoUIKitPrebuiltCall(
//     appID: 460459670, // your AppID,
//     appSign: '3bcda310cedb852b45fc557581256e31be49bb1a5f607b7d748cbe559a323d9c',
//     userID: '1234567890',
//     userName: 'Juma',
//     callID: '123456',
//     config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
//   );
// }
}


