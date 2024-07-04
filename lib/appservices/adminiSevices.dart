import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdministratorServices {
  Future<void> register_Department(String departmentName, code, context) async {
    _showLoadingDialog(context);
    try {
      await FirebaseFirestore.instance
          .collection("Department")
          .doc(departmentName)
          .set({
        "Code": code,
        "Department": departmentName,
      });
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future register_Department_Member(String _departmentName, _firstName,
      _lastName, _emailAddress, _phoneNumber, _staffID, _password) async {
    return await FirebaseFirestore.instance
        .collection("DepartmentMembers") // Change to "departments"
        .doc(_emailAddress)
        .set({
      "DepartmentId": _departmentName,
      "FirstName": _firstName,
      "LastName": _lastName,
      "Email": _emailAddress,
      "PhoneNumber": _phoneNumber,
      "StaffId": _staffID,
      "Password": _password
    });
  }

  Future all_access_for_users(
    String _emailAddress,
  ) async {
    return await FirebaseFirestore.instance
        .collection("AccessControls") // Change to "departments"
        .doc(_emailAddress)
        .set({
      "StaffRegister": "Denied",
      "VisitorRegister": "Denied",
      "ViewAllVisitors": "Denied",
      "MyVisitors": "Allowed",
    });
  }

  Future<void> accessGranted(
    String staffMail,
    accessGiven,
  ) async {
    print(accessGiven);
    print(staffMail);
    await FirebaseFirestore.instance
        .collection("AccessControls")
        .doc(staffMail)
        .update({
      accessGiven: "Allowed",
    });
  }

  Future<void> accessDenied(String staffMail, accessGiven) async {
    await FirebaseFirestore.instance
        .collection("AccessControls")
        .doc(staffMail)
        .update({
      accessGiven: "Denied",
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              )),
        );
      },
    );
  }
}
