import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/registerNewVisitor.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';

class ReceptionMainMenuScreen extends StatefulWidget {
  const ReceptionMainMenuScreen({super.key});

  @override
  State<ReceptionMainMenuScreen> createState() => _ReceptionMainMenuScreenState();
}

class _ReceptionMainMenuScreenState extends State<ReceptionMainMenuScreen> {
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
          InkWell(
            onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterNewVisitor()));
            },
            child: serviceCard("Registor Visitor")),
                    serviceCard("Visitors Management"),
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
