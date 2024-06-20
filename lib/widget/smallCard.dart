import 'package:flutter/material.dart';
import 'package:visitors/widget/utils/dimensions.dart';

class SmallCard {
  Widget smal_card(context,String cardlabel,Color color) {
    return Card(
      color: color,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: Dimensions.height150(context),
        child: Center(child: Text(cardlabel)),
      ),
    );
  }
}
