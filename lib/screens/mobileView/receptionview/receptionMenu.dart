import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/registerNewVisitor.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';

class ReceptionMainMenuScreen extends StatefulWidget {
  const ReceptionMainMenuScreen({super.key});

  @override
  State<ReceptionMainMenuScreen> createState() =>
      _ReceptionMainMenuScreenState();
}

class _ReceptionMainMenuScreenState extends State<ReceptionMainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.5),
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
                    builder: (context) => RegisterNewVisitor()));
              },
              child: serviceCard("Registor Visitor")),
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
