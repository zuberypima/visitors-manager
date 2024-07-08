import 'package:flutter/material.dart';

class NoAccessScreen extends StatelessWidget {
  const NoAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have no right for this App"),
            SizedBox(
              height: 20,
            ),
            Text("Please Communicate with your Admin")
          ],
        ),
      ),
    );
  }
}
