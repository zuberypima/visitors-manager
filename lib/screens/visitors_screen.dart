import 'package:flutter/material.dart';
import 'package:visitors/widget/big_text.dart';
import 'package:visitors/widget/utils/colors.dart';


class VisitorsScreen extends StatefulWidget {
  const VisitorsScreen({super.key});

  @override
  State<VisitorsScreen> createState() => _VisitorsScreenState();
}

class _VisitorsScreenState extends State<VisitorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: BigText(text: "Visitors Screen"),
      ),
    );
  }
}