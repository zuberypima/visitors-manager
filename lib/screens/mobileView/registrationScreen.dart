import 'package:flutter/material.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            SizedBox(
              height: 40
            ),
            Text("Register"),
            Divider(),
            Text(
              "First Name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
                hintText: "Juma",
                nameControler: _emailController),
            SizedBox(
              height: 10,
            ),
              Text(
              "Last Name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              
                hintText: "Mgunda",
                nameControler: _emailController),
            SizedBox(
              height: 10,
            ),
            Divider(),
               Text(
              "Depertment Code",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              
                hintText: "IT0001",
                nameControler: _emailController),
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
                nameControler: _emailController),
            SizedBox(
              height: 10,
            ),
            
              Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            CustomTextFormFieldOne(
              
                hintText: "0755896546",
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
                  child: Text("Register")),
            )
          ],
        ),
      ),
    );
  }
}
