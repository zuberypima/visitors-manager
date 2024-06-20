import 'package:flutter/material.dart';
import 'package:visitors/widget/small_text.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class FormFielOne extends StatelessWidget {
  String labelText;
  String requiredSymbol;
  String hintText;

  TextEditingController nameControler;
  FormFielOne(
      {super.key,
      required this.labelText,
      required this.requiredSymbol,
      required this.hintText,
      required this.nameControler});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.width130(context),
          child: Row(
            children: [
              SmallText(text: labelText),
              SmallText(
                text: requiredSymbol,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
              height: Dimensions.height50(context),
              child: Center(
                child: TextFormField(
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
                ),
              )),
        )
      ],
    );
  }
}
