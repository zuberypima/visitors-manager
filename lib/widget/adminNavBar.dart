import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/screens/servicesDashboard.dart';
import 'package:visitors/screens/visitorsDashboard.dart';

class AdmintNavBar {
  Widget adminiNavBar(context) {
    final provider = Provider.of<WidgetProviders>(context);
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      color: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const CircleAvatar(
              maxRadius: 60,
              child: Icon(
                Icons.person,
                size: 75,
              ),
            ),
            const SizedBox(
              height: 20,
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
                  icon: const Icon(Icons.people),
                  label: const Text("Visitors")),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    provider.getSelectedWidget(const ServicesDashBoard());
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text("Services")),
            ),
          ],
        ),
      ),
    );
  }
}
