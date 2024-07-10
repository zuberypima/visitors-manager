import 'package:flutter/material.dart';

Widget service_Card(String cardlabel, IconData icondata) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 51, 189, 253),
            ],
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icondata,
            color: Colors.white,
            size: 45,
          ),
          Text(
            cardlabel,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
