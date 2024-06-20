import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visitors/services/adminServices.dart';

class AccessControlScreen extends StatefulWidget {
  String userEmail;
  AccessControlScreen({super.key, required this.userEmail});

  @override
  State<AccessControlScreen> createState() => _AccessControlScreenState();
}

String? statusText;

class _AccessControlScreenState extends State<AccessControlScreen> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('AccessControls');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc(widget.userEmail).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              statusText = data['StaffRegister'];
              return ListView(
                children: [

                  Card(
                    child: ListTile(
                      title: Text("Register Visitor:"),
                      subtitle: Row(
                        children: [
                          ElevatedButton(
                             style:const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.green)),
                              onPressed: () {
                                AdministratorServices().accessDenied(
                                    widget.userEmail, 'StaffRegister');
                              },
                              child: Text("Denied")),
                          ElevatedButton(
                             style:const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.green)),
                              onPressed: () {
                                AdministratorServices().accessGranted(
                                    "master@g.com", 'StaffRegister');
                                setState(() {
                                  statusText = data['StaffRegister'];
                                });
                              },
                              child: Text("Allow")),
                        ],
                      ),
                      trailing: Text(statusText!),
                    ),
                  ),
                ],
              );
            }
            return Text("loading");
          },
        ),
      ),
    );
  }

Widget accessControlCard (){
  return   Card(
                    child: ListTile(
                      title: Text("Register Visitor:"),
                      subtitle: Row(
                        children: [
                          ElevatedButton(
                             style:const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green)),
                              onPressed: () {
                                AdministratorServices().accessDenied(
                                    widget.userEmail, 'StaffRegister');
                              },
                              child: Text("Denied")),
                          ElevatedButton(
                             style:const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green)),
                              onPressed: () {
                                AdministratorServices().accessGranted(
                                    "master@g.com", 'StaffRegister');
                                setState(() {
                                  // statusText = data['StaffRegister'];
                                });
                              },
                              child: Text("Allow")),
                        ],
                      ),
                      trailing: Text(statusText!),
                    ),
                  );
}
}
