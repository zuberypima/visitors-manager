import 'package:flutter/material.dart';
import 'package:visitors/widget/utils/dimensions.dart';

Widget formFieldOne(
    context, String labelName, TextEditingController _controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(labelName),
      Container(
          height: 35,
          width: MediaQuery.of(context).size.width / 3.2,
          child: Center(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(left: Dimensions.width10(context)),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
          ))
    ],
  );
}
