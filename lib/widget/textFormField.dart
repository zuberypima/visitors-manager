import 'package:flutter/material.dart';
import 'package:visitors/widget/small_text.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class CustomTextFormFieldOne extends StatelessWidget {
  // String labelText;
  // String requiredSymbol;
  String hintText;

  TextEditingController nameControler;
  CustomTextFormFieldOne(
      {super.key,
      // required this.labelText,
      // required this.requiredSymbol,
      required this.hintText,
      required this.nameControler});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: nameControler,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        return null;
        // Return null if the input is valid
      },
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: Dimensions.width10(context)),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder()),
    );
  }
}
