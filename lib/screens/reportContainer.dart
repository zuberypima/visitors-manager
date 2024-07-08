import 'package:flutter/material.dart';
import 'package:visitors/widget/reportcards/allvisitorsToday.dart';
import 'package:visitors/widget/utils/colors.dart';

Widget repordContainer(context) {
  return Container(
    height: MediaQuery.of(context).size.height / 3,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue,
            Color.fromARGB(255, 51, 189, 253),
            Colors.lightBlue,
            Color.fromARGB(255, 51, 189, 253),
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 30,
      ),
      children: [
        // todayVisitorsCard(
        //   "Today Visit",
        //   'CheckIn',
        //   white,
        // ),
        todayVisitorsCard("Today Visit", 'CheckIn', Colors.amber),
        visitorStatusCard('Check Out', 'CheckOut', Colors.redAccent),
        visitorStatusCard('Check in', 'CheckIn', Colors.greenAccent),
        todayVisitorsCard("Other", 'CheckIn', Colors.pinkAccent)
      ],
    ),
  );
}
