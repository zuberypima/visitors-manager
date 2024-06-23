import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/dataSelectedPRovider.dart';
import 'package:visitors/services/assignVisitor.dart';
import 'package:visitors/services/dataSaver.dart';
import 'package:visitors/widget/big_text.dart';
import 'package:visitors/widget/textFormField.dart';
import 'package:visitors/widget/utils/dimensions.dart';

import '../../widget/formOne.dart';

//  Registernewvisitor
//extends StatefulWidget {

class RegisterNewVisitor extends StatefulWidget {
  const RegisterNewVisitor({super.key});
  @override
  State<RegisterNewVisitor> createState() => _RegisterNewVisitorState();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();

class _RegisterNewVisitorState extends State<RegisterNewVisitor> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataSelectedProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: ListView(
            children: [
              Text(
                "Register Visitor",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              Divider(),
              CustomTextFormFieldOne(
                  hintText: "Visitor Full Name",
                  nameControler: fullNameController),
              SizedBox(height: Dimensions.height20(context)),

              // Email reciew
              CustomTextFormFieldOne(
                  hintText: "Email Address", nameControler: emailController),

              SizedBox(height: Dimensions.height20(context)),

              // Mobile Number recieve
              CustomTextFormFieldOne(
                  hintText: "Enter Mobile", nameControler: mobileController),

              SizedBox(height: Dimensions.height20(context)),
              ElevatedButton(
                  onPressed: () {
                    AssingVisitors().selectDepartMent(context);
                  },
                  child: Text("Assign Visitor To:")),
              SizedBox(height: Dimensions.height20(context)),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Department:",
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(provider.selectedDepartment),
                ],
              ),
              SizedBox(height: Dimensions.height20(context)),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Staff Member Name :",
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(provider.selectedStaffMember),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      onPressed: () {
                        DataSever()
                            .addVisitor(
                          fullNameController.text,
                          emailController.text,
                          mobileController.text,
                        )
                            .then((value) {
                          DataSever().registerVisitor_to_Department(
                              fullNameController.text,
                              emailController.text,
                              mobileController.text,
                              provider.selectedDepartment,
                              provider.selectedStaffMember,
                              "CheckIn");
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        "Register Visitor",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
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
