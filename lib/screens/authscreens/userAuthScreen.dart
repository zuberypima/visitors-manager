import 'package:flutter/material.dart';
import 'package:visitors/screens/authscreens/adminiAuthScreen.dart';
import 'package:visitors/screens/receptionScreen.dart';
import 'package:visitors/services/auth_services.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({super.key});

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

TextEditingController _emailAddress = TextEditingController();
TextEditingController _password = TextEditingController();

class _UserAuthScreenState extends State<UserAuthScreen> {
  // bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(108, 0, 187, 212),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdministratorAuthScreen(
                          userLogedIn: "Administrator",
                        )));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 30),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    Text(
                      "Administrator",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Visitor Management",
            style: TextStyle(
                color: Colors.white, fontSize: 34, fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _emailAddress,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email Address",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          foregroundColor:
                              WidgetStatePropertyAll<Color>(Colors.black),
                          backgroundColor: WidgetStatePropertyAll<Color>(
                            Colors.amber,
                          )),
                      onPressed: () async {
                        loadingBox(context);

                        AuthenticationServices().normaUserAuthenticate(
                          context,
                          _emailAddress.text,
                          _password.text,
                        );
                      },
                      child: Center(
                        child: Text("LogIn"),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  loadingContainer() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: 150,
              height: 100,
              color: Colors.amber,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  // Loading Box

  void loadingBox(BuildContext context, [bool mounted = true]) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 15),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
    // Simulate an asynchronous computation (replace with your actual logic)
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (contex) => ReceptionScreen()));
    confirmationBox();
  }

  void confirmationBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Registration Successful"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clearContorler();
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}
