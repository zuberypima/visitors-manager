import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/widget/adminNavBar.dart';

class AdminiDashBoardScreen extends StatefulWidget {
  const     AdminiDashBoardScreen({super.key});

  @override
  State<AdminiDashBoardScreen> createState() => _AdminiDashBoardScreenState();
}

class _AdminiDashBoardScreenState extends State<AdminiDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProviders>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Administrator",
          style: TextStyle(color: Colors.white),
        ),
backgroundColor: Colors.cyan,),
      body: Row(
        children: [
          AdmintNavBar().adminiNavBar(context),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: provider.selectedScreen,
            ),
          ),
        ],
      ),
    );
  }
}
