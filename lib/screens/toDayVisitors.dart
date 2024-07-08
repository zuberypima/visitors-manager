import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AllTodayVisists extends StatefulWidget {
  const AllTodayVisists({super.key});

  @override
  State<AllTodayVisists> createState() => _AllTodayVisistsState();
}

DateTime nowDate = DateTime.now();

class _AllTodayVisistsState extends State<AllTodayVisists> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('VisitorsOfDepartment')
            .where("Date", isEqualTo: formattedDate)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No Visitor today"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  color: Colors.greenAccent,
                  child: ListTile(
                    title: Text(data['FullName']),
                    subtitle: Row(
                      children: [
                        Row(
                          children: [
                           const Text(
                              "Phone No: ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(data['PhoneNumber']),
                          ],
                        ),
                     const   SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Department : ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(data['Department']),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "To Staff : ",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(data['StaffVisited']),
                          ],
                        )
                      ],
                    ),
                    trailing: InkWell(
                        onTap: () {},
                        child: Text(
                          "CheckIn",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
