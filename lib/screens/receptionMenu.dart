import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/new_visitor_regform.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/widget/reportcards/allvisitorsToday.dart';
import 'package:visitors/widget/utils/colors.dart';

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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: repordContainer(context),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
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
                          builder: (context) => MobileVisitorsView()));
                    },
                    child: serviceCard("Visitors", Icons.person_add)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RegisterNewVisitor()));
          },
          child: Text('New Visitor'),
        ),
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

Widget repordContainer(context) {
  return Container(
    height: MediaQuery.of(context).size.height / 3,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue,
            Color.fromARGB(255, 51, 189, 253),
            Colors.lightBlue,
            Color.fromARGB(255, 51, 189, 253),
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 30,
      ),
      children: [
        todayVisitorsCard("Today Visit", 'CheckIn', Colors.amber),
        visitorStatusCard('Check Out', 'CheckOut', Colors.redAccent),
        visitorStatusCard('Check in', 'CheckIn', Colors.greenAccent),
        todayVisitorsCard("Other", 'CheckIn', Colors.pinkAccent)
      ],
    ),
  );
}
