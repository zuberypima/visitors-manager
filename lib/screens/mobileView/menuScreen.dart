import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/registerNewVisitor.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/widget/reportcards/allvisitorsToday.dart';

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
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5),
              children: [
                todayVisitorsCard(),
                // Card(
                //   child: Center(child: Text("Today Visitors")),
                // ),
                Card(
                  child: Center(child: Text("Today Visitors")),
                ),
                Card(
                  child: Center(child: Text("Today Visitors")),
                ),
                Card(
                  child: Center(child: Text("Today Visitors")),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3),
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StaffManagement()));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterNewVisitor()));
                    },
                    child: serviceCard("Registor Visitor")),
                serviceCard("Visitors Management"),
                serviceCard("Access Service")
              ],
            ),
          ),
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
