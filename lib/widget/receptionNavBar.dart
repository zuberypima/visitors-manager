import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/dashboard.dart';
import 'package:visitors/screens/departmentList.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/screens/visitorsDashboard.dart';


class LeftNavBar {
  Widget leftNavBar(context) {
    final provider = Provider.of<WidgetProviders>(context);
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      color:const Color.fromRGBO(7, 125, 251, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
         const   CircleAvatar(
              maxRadius: 100,
              child: Icon(
                Icons.person,
                size: 75,
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    provider.getSelectedWidget(DashBoardPage());
                  },
                  icon:const Icon(Icons.home),
                  label:const Text("Home")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: ElevatedButton.icon(
                  onPressed: () {
                    provider.getSelectedWidget(DepartMenListtScreens());
                  },
                  icon:const Icon(Icons.home),
                  label:const Text("Departments")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    provider.getSelectedWidget(const VisitorsDashBoard());
                  },
                  icon:const Icon(Icons.people),
                  label:const Text("Visitors")),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
