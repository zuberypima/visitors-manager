import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitors/services/adminServices.dart';
import 'package:visitors/widget/textFormField.dart';

class Departmentmobileview extends StatefulWidget {
  const Departmentmobileview({super.key});

  @override
  State<Departmentmobileview> createState() => _DepartmentmobileviewState();
}

class _DepartmentmobileviewState extends State<Departmentmobileview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departments"),
      ),
      body:  StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("collectionPath").snapshots(),
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
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          }).toList(),
        );}),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _registerDepartment();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _registerDepartment() {
    TextEditingController _departmentCode = TextEditingController();
    TextEditingController _departmentName = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Department Code"),
                  CustomTextFormFieldOne(
                      hintText: "IT001", nameControler: _departmentCode),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Department Name"),
                  CustomTextFormFieldOne(
                      hintText: "Infotmation Technology",
                      nameControler: _departmentName)
                ],
              ),
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("Cancel")),
              ElevatedButton(onPressed: () {
                 AdministratorServices().register_Department(_departmentName.text, _departmentCode.text);
              }, child: Text("Save"))
            ],
          );
        });
  }
}
