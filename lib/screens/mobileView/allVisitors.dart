import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewAllVisitors extends StatefulWidget {
  const ViewAllVisitors({super.key});

  @override
  State<ViewAllVisitors> createState() => _ViewAllVisitorsState();
}

class _ViewAllVisitorsState extends State<ViewAllVisitors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("VisitorsOfDepartment")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
