import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DataSever {
  // Add Visitors to a Database
  DateTime nowDate = DateTime.now();
  Future<void> addVisitor(
    String visitorName,
    email,
    phoneNumber,
  ) async {
    String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);

    await FirebaseFirestore.instance
        .collection("Visitors")
        .doc(phoneNumber)
        .set({
      "FullName": visitorName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Date": formattedDate,
    });
  }

  Future<void> registerVisitor_to_Department(String visitorName, email,
      phoneNumber, departmentName, staffName, visitiStatus) async {
    String formattedDate = DateFormat('dd-MM-yyyy').format(nowDate);
    await FirebaseFirestore.instance
        .collection("VisitorsOfDepartment")
        .doc(phoneNumber)
        .set({
      "FullName": visitorName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Department": departmentName,
      "StaffVisited": staffName,
      "VisitiStatus": visitiStatus,
      "ServiceStatus": "NotAttende",
      "Date": formattedDate,
    });
  }
}
