import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/access_control_page.dart';


class RolesAndPositions extends StatefulWidget {
  const RolesAndPositions({super.key});

  @override
  State<RolesAndPositions> createState() => _RolesAndPositionsState();
}

class _RolesAndPositionsState extends State<RolesAndPositions> {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('DepartmentMembers').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Uses Access and Contorol"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  // popScreen(RolesandPostionForm());
                },
                child: Text("Register")),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return InkWell(
              onTap: () {
                // AccessControlList().accessControlPop(context, data["Email"]);
                popScreen(AccessControlScreen(userEmail: data["Email"]));
              },
              child: ListTile(
                title: Text(data['FirstName']),
                // subtitle: Text(data['company']),
              ),
            );
          }).toList(),
        );
      },
    ),
    );
  }

  popScreen(Widget clickedScreen) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Create New Role/Position,"),
            content: clickedScreen,
          );
        });
  }
}
