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
      // backgroundColor: Colors.orangeAccent[100],
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            // child: todayVisitorsCard(),
            child: Column(
              children: [Text("Today Visitors")],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5),
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StaffManagement()));
                    },
                    child: serviceCard(
                        "Staff Management", Icons.group_work_outlined)),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterNewVisitor()));
                    },
                    child: serviceCard("Registor Visitor", Icons.person_add)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget serviceCard(String cardlabel, IconData icondata) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 51, 189, 253),
            ],
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icondata,
            color: Colors.white,
            size: 45,
          ),
          Text(
            cardlabel,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
