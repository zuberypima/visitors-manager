import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StaffManagement()));
              },
              child: serviceCard("Staff Management")),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Departmentmobileview()));
              },
              child: serviceCard("Departmants")),
          serviceCard("Visitors Management"),
          serviceCard("Access Service")
        ],
      ),
    );
  }
}

Widget serviceCard(String cardlabel) {
  return Card(
    child: Center(
      child: Text(cardlabel),
    ),
  );
}
