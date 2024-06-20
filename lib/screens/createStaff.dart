import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/screens/staff_reg_form.dart';

// ignore: must_be_immutable
class StaffMembers extends StatefulWidget {
  String selectedDepartment;
  StaffMembers({super.key, required this.selectedDepartment});

  @override
  State<StaffMembers> createState() => _StaffMembersState();
}

class _StaffMembersState extends State<StaffMembers> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProviders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedDepartment +"  "+"Members"),
        actions: [
           ElevatedButton(
              onPressed: () {
                popScreen(StaffRegForm(
                  selectedDepartment: widget.selectedDepartment,
                ));
              },
              child: const Text("Register Staff"))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('DepartmentMembers')
            .where("DepartmentId", isEqualTo: widget.selectedDepartment)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Map the data from the snapshot to create grid items
          final List<Map<String, dynamic>> data =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            return document.data()! as Map<String, dynamic>;
          }).toList();

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, 
                mainAxisExtent: 90),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(data[index]['Name']),
                  subtitle: Text(data[index]['PhoneNumber']),
                  trailing: const Text(
                    "Present",
                    style: TextStyle(),
                  ),
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
