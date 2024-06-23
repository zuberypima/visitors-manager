import 'package:flutter/material.dart';
import 'package:visitors/widget/utils/colors.dart';
import 'package:visitors/widget/utils/dimensions.dart';

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

