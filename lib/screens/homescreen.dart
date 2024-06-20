import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/widget/receptionNavBar.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

bool showTextField = false;

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProviders>(context);

    return Scaffold(
      body: Row(
        children: [
          LeftNavBar().leftNavBar(context),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width /2.5,
              child: provider.selectedScreen,
            ),
          ),
        ],
      ),
    );
  }

}
