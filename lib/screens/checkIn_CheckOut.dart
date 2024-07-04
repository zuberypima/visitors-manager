import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitors/appservices/receptionService.dart';

class CheckVistors {
  Widget check_in_visitors(context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('VisitorsOfDepartment')
            .where("VisitiStatus", isEqualTo: "CheckIn")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
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
                  title: Text(data['FullName'].toString()),
                  subtitle: Text(data['PhoneNumber']),
                  trailing: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll<Color>(Colors.red),
                      ),
                      onPressed: () {
                        ReceptionService()
                            .visitorStatus(data["PhoneNumber"], "CheckOut");
                      },
                      child: Text("Check Out")),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget check_Out_visitors(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('VisitorsOfDepartment')
            .where("VisitiStatus", isEqualTo: "CheckOut")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
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
                  title: Text(data['FullName']),
                  subtitle: Text(data['PhoneNumber']),
                  trailing: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll<Color>(Colors.green),
                      ),
                      onPressed: () {
                        ReceptionService()
                            .visitorStatus(data["PhoneNumber"], "CheckIn");
                      },
                      child: Text("Check In")),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
