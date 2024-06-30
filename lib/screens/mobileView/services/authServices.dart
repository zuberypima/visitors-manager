import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/adminView/homepage.dart';
import 'package:visitors/screens/mobileView/beforAccesView/noAccessHome.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/mobileView/receptionview/receptionHome.dart';
import 'package:visitors/screens/mobileView/staffView/staffHomePage.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';

class Authservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> getCurrentUser(context) async {
    return _auth.currentUser;
  }

  Future<void> createUserAccount(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
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

  Future<void> userLogin(context, String emailAddress, password) async {
    _showLoadingDialog(context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      getUserPriverage(context, emailAddress);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> getUserPriverage(context, String userEmail) async {
    // final provider = Provider.of<WidgetProvider>(context);

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
            MaterialPageRoute(builder: (context) => Noaccesshome()),
          );
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Noaccesshome()));
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => StaffHomeView()));
        } else if (data['AccessPriveratge'].toString() == 'Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => HomePage()));
        } else if (data['AccessPriveratge'].toString() == 'Staff') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Receptionhome()),
          );

          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Receptionhome()));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Noaccesshome()),
          );
          // print('No screen assigne');
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => Receptionhome()));
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
}
