import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visitors/widget/utils/colors.dart';

// Today visit card
Widget todayVisitorsCard(
  String cardlable,
  visitStatus,
  Color cardcolor,
) {
  DateTime nowDate = DateTime.now();

  String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('VisitorsOfDepartment')
        .where('Date', isEqualTo: formattedDate)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Card(
          child: Center(child: CircularProgressIndicator()),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: cardcolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardlable),
              Text(snapshot.data!.docs.length.toString()),
            ],
          ),
        ),
      );
    },
  );
}

// Visitor status card
Widget visitorStatusCar(
  String cardlable,
  visitStatus,
  Color cardcolor,
) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('VisitorsOfDepartment')
        .where('VisitiStatus', isEqualTo: visitStatus)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Card(
          child: Center(child: CircularProgressIndicator()),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: cardcolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardlable),
              Text(snapshot.data!.docs.length.toString()),
            ],
          ),
        ),
      );
    },
  );
}
