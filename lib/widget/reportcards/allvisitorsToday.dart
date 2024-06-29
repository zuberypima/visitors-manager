import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget todayVisitorsCard() {
  DateTime nowDate = DateTime.now();

  String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);

  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('Visitors')
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
      return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Today Visitors"),
            Text(snapshot.data!.docs.length.toString()),
          ],
        ),
      );
    },
  );
}
