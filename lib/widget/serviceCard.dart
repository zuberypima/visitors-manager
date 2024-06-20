import 'package:flutter/material.dart';

class ServiceCard {
  Widget serviceCard(context, IconData iconData, String cardLable) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 70,
            color:const Color.fromRGBO(7, 125, 251, 1),
          ),
          Center(
              child: Text(
            cardLable,
            style:const TextStyle(color: Color.fromRGBO(7, 125, 251, 1)),
          )),
        ],
      ),
    );
  }
}
