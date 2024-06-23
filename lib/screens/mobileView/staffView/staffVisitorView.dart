import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Staffvisitorview extends StatefulWidget {
  const Staffvisitorview({super.key});

  @override
  State<Staffvisitorview> createState() => _StaffvisitorviewState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _StaffvisitorviewState extends State<Staffvisitorview> {
  @override
  Widget build(BuildContext context) {
    print(_auth.currentUser!.email.toString());
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      appBar: AppBar(
        elevation: 0,
        title: Text("My Visitors"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("VisitorsOfDepartment")
            .where('StaffVisited',
                isEqualTo: _auth.currentUser!.email.toString())
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
