import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/new_visitor_regform.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/screens/my_visitors.dart';
import 'package:visitors/widget/service_card.dart';
import 'package:visitors/widget/utils/colors.dart';

class StaffHomePage extends StatefulWidget {
  const StaffHomePage({super.key});

  @override
  State<StaffHomePage> createState() => _StaffHomePageState();
}

class _StaffHomePageState extends State<StaffHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Profilescreen(),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StaffManagement()));
              },
              child: service_Card('Department Members', Icons.group_work)),
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyVisitors()));
              },
              child: service_Card('My Visitos', Icons.group)),
        ],
      ),
    );
  }
}
