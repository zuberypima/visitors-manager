import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/screens/staff_reg_form.dart';
import 'package:visitors/widget/textFormField.dart';

// ignore: must_be_immutable
class ViewAllStaffMembers extends StatefulWidget {
  String selectedDepartment;
  ViewAllStaffMembers({super.key, required this.selectedDepartment});

  @override
  State<ViewAllStaffMembers> createState() => _ViewAllStaffMembersState();
}

class _ViewAllStaffMembersState extends State<ViewAllStaffMembers> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WidgetProviders>(context);
    return Scaffold(
      backgroundColor: Colors.orangeAccent[100],
      appBar: AppBar(
        title: Text(widget.selectedDepartment),
        actions: [
          IconButton(
              onPressed: () {
                popScreen(StaffRegForm(
                    selectedDepartment: widget.selectedDepartment));
              },
              icon:const Icon(Icons.add))
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
                crossAxisCount: 4, mainAxisExtent: 90),
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
    TextEditingController _emailController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add staff Email"),
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormFieldOne(
                        hintText: "staff@gmail.com",
                        nameControler: _emailController)
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  child: Text("Save"))
            ],
          );
        });
  }
}
