import 'package:flutter/material.dart';

class MobileVisitorsView extends StatefulWidget {
  const MobileVisitorsView({super.key});

  @override
  State<MobileVisitorsView> createState() => _MobileVisitorsViewState();
}

class _MobileVisitorsViewState extends State<MobileVisitorsView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.orange[200],
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Today"),
                ),
                Tab(
                  child: Text("Check In"),
                ),
                Tab(
                  child: Text("Check Out"),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            Center(
              child: Text("today"),
            ),
            Center(
              child: Text("check in"),
            ),
            Center(
              child: Text("check out"),
            ),
          ])),
    );
  }
}
