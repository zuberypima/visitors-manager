import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitors/services/adminServices.dart';

class AccessControlList {
  CollectionReference users =
      FirebaseFirestore.instance.collection('AccessControls');

  String labletest = "";
  accessControlPop(context, _userEmail) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(""),
            content: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(_userEmail).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text("Register Staff:"),
                            trailing: Text("${data['StaffRegister']}"),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text("Viwe all visitors:"),
                            trailing: Text("${data['ViewAllVisitors']}"),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text("Register Visitor:"),
                            subtitle: Row(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      AdministratorServices().accessDenied(
                                          "juma@g.com", 'StaffRegister');
                                    },
                                    child: Text("Denied")),
                                ElevatedButton(
                                    onPressed: () {
                                      // Navigator.pop(context);
                                      // popScreen(context);
                                      // AdministratorServices().accessGranted(
                                      //     "juma@g.com", 'StaffRegister');
                                      AdministratorServices().accessGranted(
                                          "master@g.com", 'StaffRegister');
                                          
                                    },
                                    child: Text("Allow")),
                              ],
                            ),
                            trailing: Text("${data['VisitorRegister']}"),
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
        });
  }

  popScreen(
    context,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                child: Center(
                    child: AccessControlList()
                        .accessControlPop(context, "master@g.com"))),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    // AdministratorServices()
                    //     .accessGranted("master@g.com", 'StaffRegister');
                    Navigator.pop(context);
                  },
                  child: Text("Continue"))
            ],
          );
        });
  }
}
