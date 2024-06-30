import 'package:flutter/material.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class CustomTextFormFieldOne extends StatelessWidget {
  String hintText;
  TextEditingController nameControler;
  bool obscureText;
  CustomTextFormFieldOne(
      {super.key,
      required this.hintText,
      required this.nameControler,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
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
          contentPadding: EdgeInsets.only(left: Dimensions.width10(context)),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder()),
    );
  }
}
