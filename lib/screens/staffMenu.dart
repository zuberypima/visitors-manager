import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/registerNewVisitor.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/widget/utils/colors.dart';

class StaffMainMenuScreen extends StatefulWidget {
  const StaffMainMenuScreen({super.key});

  @override
  State<StaffMainMenuScreen> createState() => _StaffMainMenuScreenState();
}

class _StaffMainMenuScreenState extends State<StaffMainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StaffManagement()));
              },
              child: serviceCard("Department Members")),
          // InkWell(
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => Departmentmobileview()));
          //     },
          //     child: serviceCard("Departmants")),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterNewVisitor()));
              },
              child: serviceCard("Registor Visitor")),
          // serviceCard("Visitors Management"),

          // serviceCard("Access Service")
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
