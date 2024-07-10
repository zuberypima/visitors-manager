import 'package:flutter/material.dart';
import 'package:visitors/screens/mobileView/loginScreen.dart';
import 'package:visitors/screens/mobileView/services/authServices.dart';
import 'package:visitors/screens/mobileView/services/mobileDataServices.dart';
import 'package:visitors/widget/textFormField.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _staffID = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "First Name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "Juma",
              nameControler: _firstName,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Last Name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "Mgunda",
              nameControler: _lastName,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "mgunda@gmail.com",
              nameControler: _emailController,
              obscureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              hintText: "0755896546",
              nameControler: _phoneNumber,
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
                  onPressed: () async {
                    await Authservices()
                        .createUserAccount(
                            context, _emailController.text, _password.text)
                        .then((context) => Mobiledataservices().adduserDetails(
                              _firstName.text,
                              _lastName.text,
                              _emailController.text,
                              _phoneNumber.text,
                            ));
                  },
                  child: Text("Register")),
            ),
            Divider(),
            Row(
              children: [
                Text("I already have an account"),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
