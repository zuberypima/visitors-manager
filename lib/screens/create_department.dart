import 'package:flutter/material.dart';
import 'package:visitors/appservices/adminiSevices.dart';
import 'package:visitors/widget/big_text.dart';
import 'package:visitors/widget/formOne.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class CreateDepartmentPage extends StatefulWidget {
  const CreateDepartmentPage({super.key});

  @override
  State<CreateDepartmentPage> createState() => _CreateDepartmentPageState();
}

TextEditingController departmentNameController = TextEditingController();
TextEditingController departmentCodeController = TextEditingController();

class _CreateDepartmentPageState extends State<CreateDepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 2,
          color: Colors.white,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create New Department",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Divider(),

                formFieldOne(
                    context, "Department Name", departmentNameController),
                SizedBox(height: Dimensions.height20(context)),

                // Mobile Number recieve
                formFieldOne(context, "Code", departmentCodeController),

                SizedBox(height: Dimensions.height20(context)),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: Dimensions.height20(context)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () async {
                        await AdministratorServices().register_Department(
                            departmentNameController.text,
                            departmentCodeController.text,
                            context);
                        Navigator.pop(context);
                      },
                      child: BigText(
                        text: "Register Department",
                        color: Colors.white,
                        size: Dimensions.font14(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
