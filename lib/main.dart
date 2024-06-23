import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/homepage.dart';
import 'package:visitors/screens/homescreen.dart';
import 'package:visitors/screens/mobileView/departmentMobileView.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/mobileView/profileScreen.dart';
import 'package:visitors/screens/mobileView/registrationScreen.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/screens/mobileView/staffMobileview.dart';
import 'package:visitors/screens/provider/dataSelectedPRovider.dart';
import 'package:visitors/screens/provider/widgetprovider.dart';
import 'package:visitors/signup/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBkQ7spyMgoPwqrTiV01yBZ1LQp7UFkVRE",
    appId: "1:129071823298:android:712660197cea009b197e5b",
    messagingSenderId: "129071823298",
    projectId: "visitors-eb54e",
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => WidgetProvider()),
      ChangeNotifierProvider(create: (_) => DataSelectedProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    //  home: FutureBuilder(
    //         future: Authservices().getCurrentUser(),
    //         builder: (context, AsyncSnapshot snapshot) {
    //           if (snapshot.connectionState == ConnectionState.done) {
    //             if (snapshot.hasData) {
    //               return  HomePage();
    //             }
    //             return LoginScreen();
    //           }
    //           return Center(child: CircularProgressIndicator(),);
        //    })
     home:HomePage()
    );
  }
}
