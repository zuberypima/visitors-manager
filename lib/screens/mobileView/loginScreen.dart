import 'package:flutter/material.dart';
import 'package:visitors/widget/textFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 40
            ),
            Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
                hintText: "master@gmail.com",
                nameControler: _emailController),
            SizedBox(
              height: 10,
            ),
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
                hintText: "******",
                nameControler: _emailController),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.orangeAccent),
                          foregroundColor: WidgetStatePropertyAll(Colors.white)
                          ),
                  onPressed: () {},
                  child: Text("Login")),
            )
          ],
        ),
      ),
    );
  }
}
