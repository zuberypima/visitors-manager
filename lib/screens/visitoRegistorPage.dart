import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visitors/screens/provider/dataSelectedPRovider.dart';
import 'package:visitors/services/assignVisitor.dart';
import 'package:visitors/services/dataSaver.dart';
import 'package:visitors/widget/big_text.dart';
import 'package:visitors/widget/formOne.dart';
import 'package:visitors/widget/utils/dimensions.dart';


class VisitorRegistor extends StatefulWidget {
  const VisitorRegistor({super.key});
  @override
  State<VisitorRegistor> createState() => _VisitorRegistorState();
}

TextEditingController fullNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();

class _VisitorRegistorState extends State<VisitorRegistor> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataSelectedProviders>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formFieldOne(
                      context, "Visitor Full Name", fullNameController),
                  SizedBox(height: Dimensions.height20(context)),

                  // Email reciew
                  formFieldOne(context, "Email Address", emailController),
                  SizedBox(height: Dimensions.height20(context)),

                  // Mobile Number recieve
                  formFieldOne(context, "Enter Mobile", mobileController),

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

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: Dimensions.height20(context)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
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
                            "CheckIn"
                            );
                            Navigator.pop(context);
                          });
                        },
                        child: BigText(
                          text: "Register Visitor",
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
    );
  }
}
