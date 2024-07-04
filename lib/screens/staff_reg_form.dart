import 'package:flutter/material.dart';
import 'package:visitors/appservices/adminiSevices.dart';
import 'package:visitors/widget/big_text.dart';
import 'package:visitors/widget/formOne.dart';
import 'package:visitors/widget/utils/dimensions.dart';

// ignore: must_be_immutable
class StaffRegForm extends StatefulWidget {
  String selectedDepartment;
  StaffRegForm({super.key, required this.selectedDepartment});

  @override
  State<StaffRegForm> createState() => _StaffRegFormState();
}

TextEditingController _departmentName = TextEditingController();
TextEditingController _firstName = TextEditingController();
TextEditingController _lastName = TextEditingController();
TextEditingController _phoneNumber = TextEditingController();
TextEditingController _emailAddress = TextEditingController();
TextEditingController _staffId = TextEditingController();
TextEditingController _password = TextEditingController();

// function to create initial password
String initial_password_creater(String fistname, lastname) {
  var firstNamenaCharacter = fistname.substring(0, 1).toUpperCase();
  var lastNamenaCharacter = lastname.substring(0, 1);
  String firstPassword = firstNamenaCharacter + lastNamenaCharacter + "1234";
  return firstPassword;
}

class _StaffRegFormState extends State<StaffRegForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Column(
            children: [
              Center(
                child: Text(
                  "Create New Member in ${widget.selectedDepartment} Department",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Divider(),
                    formFieldOne(context, "First Name", _firstName),
                    SizedBox(height: Dimensions.height20(context)),
                    formFieldOne(context, "Last Name", _lastName),
                    SizedBox(height: Dimensions.height20(context)),
                    formFieldOne(context, "Email Address", _emailAddress),
                    SizedBox(height: Dimensions.height20(context)),
                    formFieldOne(context, "Phone Number", _phoneNumber),
                    SizedBox(height: Dimensions.height20(context)),
                    formFieldOne(context, "Staff ID", _staffId),
                    SizedBox(height: Dimensions.height20(context)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: Dimensions.height20(context)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            var password = initial_password_creater(
                                _firstName.text, _lastName.text);
                            AdministratorServices().register_Department_Member(
                                widget.selectedDepartment,
                                _firstName.text,
                                _lastName.text,
                                _emailAddress.text,
                                _phoneNumber.text,
                                _staffId.text,
                                password);

                            // AuthenticationServices()
                            //     .normaUserAuthenticate(context,_emailAddress.text, password);

                            AdministratorServices()
                                .all_access_for_users(_emailAddress.text);
                            Navigator.pop(context);
                          },
                          child: BigText(
                            text: "Register",
                            color: Colors.white,
                            size: Dimensions.font14(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
