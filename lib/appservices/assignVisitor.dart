import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/dataSelectedPRovider.dart';

class AssingVisitors {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Department').snapshots();
  selectDepartMent(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Departments"),
            content: Container(
              width: 300,
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          selectStaffFromDepartment(
                              context, data['Department']);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(data['Department']),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          );
        });
  }

  selectStaffFromDepartment(context, String _seleCtedDepartment) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(_seleCtedDepartment.toUpperCase()),
            content: Container(
              width: 300,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("UserDatils")
                    .where("DepartmentName", isEqualTo: _seleCtedDepartment)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if(snapshot.data!.docs.isEmpty){
                        return Center(child: Text("No Staff Registared"));
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return InkWell(
                        onTap: () {
                          Provider.of<DataSelectedProvider>(context,
                                  listen: false)
                              .getSelectedDepartmant(_seleCtedDepartment);
                          Provider.of<DataSelectedProvider>(context,
                                  listen: false)
                              .getSelectedStaffMember(data['Email'].toString());

                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(data['FirstName']),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          );
        });
  }
}
