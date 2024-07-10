import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/mobileView/callScreen.dart';
import 'package:visitors/screens/mobileView/services/mobileDataServices.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
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
    final provider = Provider.of<WidgetProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.selectedDepartment),
        actions: [
          IconButton(
              onPressed: () {
                popScreen(widget.selectedDepartment);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('UserDatils')
            .where("DepartmentName", isEqualTo: widget.selectedDepartment)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Map the data from the snapshot to create grid items
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Card(
                color: Color.fromARGB(202, 250, 250, 173),
                child: SizedBox(
                  height: 100,
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(data['LastName']),
                    subtitle: Row(
                      children: [
                        Text(data['PhoneNumber']),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                            backgroundColor: Colors.green,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CallPage(
                                            callID: '123456',
                                            userName:
                                                data['LastName'].toString(),
                                          )));
                                },
                                icon: Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                    trailing: Text("Present"),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  popScreen(String clickedScreen) {
    TextEditingController _emailController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(clickedScreen),
            content: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormFieldOne(
                      hintText: "Staff@gmail.com",
                      nameControler: _emailController,
                      obscureText: false,
                    )
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Mobiledataservices().register_staff_to_department(
                        _emailController.text, clickedScreen);
                    Navigator.pop(context);
                  },
                  child: Text("Save"))
            ],
          );
        });
  }
}
