import 'package:flutter/material.dart';

class NoAcceVisitorsView extends StatelessWidget {
  const NoAcceVisitorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
