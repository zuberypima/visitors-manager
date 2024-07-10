import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/visitor_details.dart';
import 'package:visitors/widget/utils/colors.dart';
import 'package:visitors/widget/widget.dart';

class MyVisitors extends StatefulWidget {
  const MyVisitors({super.key});

  @override
  State<MyVisitors> createState() => _MyVisitorsState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _MyVisitorsState extends State<MyVisitors> {
  @override
  Widget build(BuildContext context) {
    print(_auth.currentUser!.email.toString());
    return Scaffold(
      backgroundColor: white,
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
              return InkWell(
                onTap: () {
                  nextScreen(
                      context,
                      VisitorDetails(
                          phoneNumber: data['PhoneNumber'].toString()));
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: Icon(Icons.person),
                      ),
                    ),
                    title: Text(data['FullName']),
                    subtitle: Text(data['PhoneNumber']),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
