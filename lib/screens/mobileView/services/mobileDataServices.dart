import 'package:cloud_firestore/cloud_firestore.dart';

class Mobiledataservices {
  Future adduserDetails(
    String _firstName,
    _lastName,
    _emailAddress,
    _phoneNumber,
    _staffID,
  ) async {
    return await FirebaseFirestore.instance
        .collection("UserDatils") // Change to "departments"
        .doc(_emailAddress)
        .set({
      "FirstName": _firstName,
      "LastName": _lastName,
      "Email": _emailAddress,
      "PhoneNumber": _phoneNumber,
      "StaffId": _staffID,
      "DepartmentName": "NoDepartment",
    });
  }

  Future<void> register_staff_to_department(
      String _emailAddress, _selectedDepartment) async {
    await FirebaseFirestore.instance
        .collection("UserDatils")
        .doc(_emailAddress)
        .update({
      "DepartmentName": _selectedDepartment,
    });
  }
}
