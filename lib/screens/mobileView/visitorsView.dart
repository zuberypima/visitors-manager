import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visitors/widget/utils/colors.dart';

class VisitorsView extends StatefulWidget {
  const VisitorsView({super.key});

  @override
  State<VisitorsView> createState() => _VisitorsViewState();
}

DateTime nowDate = DateTime.now();

class _VisitorsViewState extends State<VisitorsView> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);

    return Scaffold(
      backgroundColor: white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("VisitorsOfDepartment")
            .where("Date", isEqualTo: formattedDate)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                  title: Text(data['FullName']),
                  subtitle: Text(data['PhoneNumber']),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
