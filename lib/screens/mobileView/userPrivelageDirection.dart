import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/screens/mobileView/staffView/staffHomePage.dart';

class Userprivelagedirection extends StatefulWidget {
  const Userprivelagedirection({super.key});

  @override
  State<Userprivelagedirection> createState() => _UserprivelagedirectionState();
}

class _UserprivelagedirectionState extends State<Userprivelagedirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: Authservices().getCurrentUser(context),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return StaffHomeView();
                  // HomePage();
                }
                return LoginScreen();
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
