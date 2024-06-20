import 'package:flutter/material.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height150(context),
            child: Row(
              children: [
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: Dimensions.height150(context),
                    child: Center(child: Text("Visitors")),
                  ),
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: Dimensions.height150(context),
                    child: Center(child: Text("Visitors")),
                  ),
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: Dimensions.height150(context),
                    child: Center(child: Text("Visitors")),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
