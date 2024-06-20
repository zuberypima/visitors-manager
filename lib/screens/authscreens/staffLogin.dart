import 'package:flutter/material.dart';
import 'package:visitors/services/auth_services.dart';

class StaffLoginPage extends StatefulWidget {
  const StaffLoginPage({super.key});

  @override
  State<StaffLoginPage> createState() => _StaffLoginPageState();
}

class _StaffLoginPageState extends State<StaffLoginPage> {
  TextEditingController _emailAddress =TextEditingController();
    TextEditingController _password =TextEditingController();

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(108, 0, 187, 212),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        actions: [
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
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                      // loadingBox(context);
            
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
          )
        ],
      ),
    ));
  }
}