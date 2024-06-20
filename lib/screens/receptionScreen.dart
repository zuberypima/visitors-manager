import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/widget/receptionNavBar.dart';


class ReceptionScreen extends StatefulWidget {
  const ReceptionScreen({Key? key}) : super(key: key);

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}
bool showTextField = false;

class _ReceptionScreenState extends State<ReceptionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProviders>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Reception",style: TextStyle(color: Colors.white),),
        backgroundColor:const Color.fromRGBO(7, 125, 251, 1),
      ),
      body: Row(
        children: [
          LeftNavBar().leftNavBar(context),
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
