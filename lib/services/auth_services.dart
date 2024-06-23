import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationServices {
  Future<void> create_organization_account(
      String orgName, brelaNumber, emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) {
        record_Organition_Details(orgName, brelaNumber, emailAddress);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

// Record Registered Organization Details
  CollectionReference organizatioDetails =
      FirebaseFirestore.instance.collection('OrganizationAcounts');
  record_Organition_Details(String orName, brelaNumber, emailAddress) async {
    await organizatioDetails.doc(brelaNumber).set({
      "OrgnizationName": orName,
      "BrelaRegNo": brelaNumber,
      "Email": emailAddress,
    });
  }

  Future<void> adminLogin(context, String emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

// This is the sign up for staff member
CollectionReference collectionReference =FirebaseFirestore.instance.collection("DepartmentMembers");
  Future<void> normaUserAuthenticate(context, String userEmail,passwordCredential) async {
    String collectionId =userEmail;
       collectionReference.doc(collectionId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
            String validPassword =data["Password"].toString();

        if (passwordCredential ==validPassword) {
        }
        else{
          print("Not valid");
        }
      }
    });
  }
}
