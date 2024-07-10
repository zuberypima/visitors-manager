import 'package:flutter/material.dart';
import 'package:visitors/screens/reportContainer.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/mobileVisitorsView.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/new_visitor_regform.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/widget/utils/colors.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: white,
      ),
      drawer: Drawer(
        child: Profilescreen(),
      ),
      body: ListView(
        children: [
          // todayVisitorsCard(),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
            child: repordContainer(context),
          ),
          Divider(
            color: Color.fromARGB(255, 188, 198, 203),
            thickness: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2),
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StaffManagement()));
                    },
                    child: serviceCard(
                        "Staff Manager", Icons.manage_accounts_rounded)),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Departmentmobileview()));
                    },
                    child:
                        serviceCard("Departmants", Icons.group_work_outlined)),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterNewVisitor()));
                    },
                    child:
                        serviceCard("Registor Visitor", Icons.person_add_alt)),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MobileVisitorsView(),
                      ));
                    },
                    child: serviceCard(
                        "Visitors Management", Icons.person_pin_outlined)),
                serviceCard("Access Service", Icons.person_pin_outlined)
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icondata,
            color: Colors.white,
            size: 35,
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
