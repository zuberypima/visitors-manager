import 'package:flutter/material.dart';
import 'package:visitors/screens/authscreens/organizationAuth.dart';
import 'package:visitors/screens/authscreens/userAuthScreen.dart';
import 'package:visitors/services/auth_services.dart';


// ignore: must_be_immutable
class AdministratorAuthScreen extends StatefulWidget {
  String userLogedIn;
  AdministratorAuthScreen({super.key, required this.userLogedIn});

  @override
  State<AdministratorAuthScreen> createState() =>
      _AdministratorAuthScreenState();
}
TextEditingController _emailAddress =TextEditingController();
TextEditingController _password =TextEditingController();

void clearContorler(){
  _emailAddress.clear();
  _password.clear();
}
class _AdministratorAuthScreenState extends State<AdministratorAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(108, 0, 187, 212),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.userLogedIn,
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
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
                          hintText: "Email Addres",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    child: TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              WidgetStatePropertyAll<Color>(Colors.black),
                          backgroundColor: WidgetStatePropertyAll<Color>(
                            Colors.amber,
                          )),
                      onPressed: () {
                        AuthenticationServices().adminLogin(context, _emailAddress.text, _password.text);
                      },
                      child: Center(
                        child: Text("LogIn"),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("No ! am not Administrator"),
                      SizedBox(
                        width: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(MaterialPageRoute(
                                builder: (context) => UserAuthScreen()));
                          },
                          child: Text("Log in as a norma user"))
                    ],
                  ),

                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white,border: Border.all(),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("New Organization"),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => OrgnizationRegister()));
                              },
                              child: Text("Register an Organization"))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
