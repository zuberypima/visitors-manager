// Page to veiw all department and can register new department only

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/create_department.dart';

class ViewAllDepartment extends StatefulWidget {
  const ViewAllDepartment({super.key});

  @override
  State<ViewAllDepartment> createState() => _ViewAllDepartmentState();
}

class _ViewAllDepartmentState extends State<ViewAllDepartment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Available Departments"),
        actions: [
          ElevatedButton(
              onPressed: () {
                popScreen(const CreateDepartmentPage());
              },
              child: Text("Add New"))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Department').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Map the data from the snapshot to create grid items
          final List<Map<String, dynamic>> data =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            return document.data()! as Map<String, dynamic>;
          }).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 120,
                childAspectRatio: 8),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  child: Center(child: Text(data[index]['Department'])),
                ),
              );
            },
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
            content: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                child: Center(child: clickedScreen)),
          );
        });
  }
}
