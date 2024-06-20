import 'package:flutter/material.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          serviceCard("Staff Management"),
          serviceCard("Departmants"),
          serviceCard("Visitors Management"),
          serviceCard("Access Service")
        ],
      ),
    );
  }
}

Widget serviceCard(String cardlabel) {
  return Card(
    child: Center(
      child: Text(cardlabel),
    ),
  );
}
