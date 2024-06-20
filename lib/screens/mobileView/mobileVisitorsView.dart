import 'package:flutter/material.dart';

class MobileVisitorsView extends StatefulWidget {
  const MobileVisitorsView({super.key});

  @override
  State<MobileVisitorsView> createState() => _MobileVisitorsViewState();
}

class _MobileVisitorsViewState extends State<MobileVisitorsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("My visitors"),),
    );
  }
}