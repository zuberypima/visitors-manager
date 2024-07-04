import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/registrationScreen.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/widget/textFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "master@gmail.com",
              nameControler: _emailController,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "******",
              nameControler: _password,
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Authservices().userLogin(
                        context, _emailController.text, _password.text);
                  },
                  child: Text("Login")),
            ),
            Row(
              children: [
                Text("I don't have an account"),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                    },
                    child: Text("Register"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
