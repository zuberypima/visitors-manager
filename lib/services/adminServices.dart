import 'package:cloud_firestore/cloud_firestore.dart';

class AdministratorServices {
  Future<void> register_Department(String departmentName, code) async {
    await FirebaseFirestore.instance
        .collection("Department")
        .doc(departmentName)
        .set({
      "Code": code,
      "Department": departmentName,
    });
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

  Future<void> accessDenied(
    String staffMail,accessGiven
  ) async {
    await FirebaseFirestore.instance
        .collection("AccessControls")
        .doc(staffMail)
        .update({
      accessGiven: "Denied",
    });
  }
}
