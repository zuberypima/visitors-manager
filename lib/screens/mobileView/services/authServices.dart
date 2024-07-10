import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/adminHomeScreen.dart';
import 'package:visitors/screens/noAccessScreen.dart';
import 'package:visitors/screens/receptionHome.dart';
import 'package:visitors/screens/staff_home_page.dart';

class Authservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> getCurrentUser(context) async {
    return _auth.currentUser;
  }

  Future<void> createUserAccount(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((_) => getUserPriverage(context, emailAddress));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _show_failed_service_dialog(context, e.code.toString());
      } else if (e.code == 'wrong-password') {
        _show_failed_service_dialog(context, e.code.toString());
      }
    }
  }

  Future<void> userLogin(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((_) => getUserPriverage(context, emailAddress));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        _show_failed_service_dialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _show_failed_service_dialog(
            context, 'Wrong password provided for that user.');
      } else {
        Navigator.pop(context);
        _show_failed_service_dialog(context, 'Wrong password or user email');
      }
    }
  }

  Future<void> getUserPriverage(context, String userEmail) async {
    FirebaseFirestore.instance
        .collection('UserDatils')
        .doc(userEmail)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data()! as Map<String, dynamic>;

        if (data['AccessPriveratge'].toString() == 'None') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NoAccessScreen()),
          );
        } else if (data['AccessPriveratge'].toString() == 'Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminMainScreen()),
          );
        } else if (data['AccessPriveratge'].toString() == 'Staff') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StaffHomePage()),
          );
        } else if (data['AccessPriveratge'].toString() == 'Reception') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Receptionhome()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => NoAccessScreen()),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<void> logOutService(context) async {
    try {
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (Context) => LoginScreen()));
    } catch (e) {
      print("User not logdout");
    }
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
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

  void _show_failed_service_dialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text(errorMessage)],
              )),
        );
      },
    );
  }
}
