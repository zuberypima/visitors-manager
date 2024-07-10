import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/screens/provider/data_provider.dart';
import 'package:visitors/screens/visitor_details.dart';
import 'screens/provider/dataSelectedPRovider.dart';
import 'screens/provider/widgetprovider.dart';

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
      ChangeNotifierProvider(create: (_) => DataProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<WidgetProvider>(context);
    // Authservices().getUserPriverage(
    //     context, FirebaseAuth.instance.currentUser!.email.toString());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: Authservices().getCurrentUser(context),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  // return const HomePage();
                  Authservices().getUserPriverage(context,
                      FirebaseAuth.instance.currentUser!.email.toString());
                }
                return const LoginScreen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
    //home: VisitorDetails(phoneNumber: '0712115689'));
  }
}
