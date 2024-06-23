import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisitorsView extends StatefulWidget {
  const VisitorsView({super.key});

  @override
  State<VisitorsView> createState() => _VisitorsViewState();
}

class _VisitorsViewState extends State<VisitorsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("VisitorsOfDepartment")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
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
