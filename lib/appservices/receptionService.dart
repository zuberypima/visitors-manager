import 'package:cloud_firestore/cloud_firestore.dart';

class ReceptionService {
  visitorStatus(String docID, visitiStatus) async {
    await FirebaseFirestore.instance
        .collection("VisitorsOfDepartment")
        .doc(docID)
        .update({
      "VisitiStatus": visitiStatus,
    });
  }
}
