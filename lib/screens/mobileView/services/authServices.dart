import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visitors/screens/homepage.dart';
import 'package:visitors/screens/mobileView/staffView/staffHomePage.dart';

class Authservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> createUserAccount(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> userLogin(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print("User with bellow email login");
      getUserPriverage(context, emailAddress);
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => StaffHomeView()));
        } else if (data['AccessPriveratge'].toString() == 'Administaror') {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }
      } else {
        print('Document does not exist on the database');
      }
    });
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
}
