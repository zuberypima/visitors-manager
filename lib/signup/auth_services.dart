import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //login
  Future logginUserWithEmaiLandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
      //call our database service to update the user data
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

//REGISTER


  Future normalRegisteredforAtuh(
      String orgCode, String _emailAddress, password) async {
    return await FirebaseFirestore.instance
        .collection("OrganizationAcounts")
        .doc(orgCode)
        .collection("DepartmentMembers") // Change to "departments"
        .doc(_emailAddress)
        .set({
      "Email": _emailAddress,
      "PhoneNumber": password,
    });
  }
}
