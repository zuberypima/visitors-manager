import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visitors/services/adminServices.dart';

class AccessControlCard {
  Widget accessControlCard(String labelText, lableStatus,docId,accessGiven) {
    return Card(
      child: ListTile(
          title: Text(labelText),
          trailing: Text(lableStatus,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
          subtitle: Row(
            children: [
              ElevatedButton(
                  style:const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.redAccent)),
                  onPressed: () {
                    AdministratorServices().accessDenied(docId, accessGiven);
                  },
                  child:const Text(
                    "Denied",
                    style: TextStyle(color: Colors.white),
                  )),
           const   SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style:const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.green)),
                  onPressed: () {
                    AdministratorServices().accessGranted(docId, accessGiven);
                  },
                  child:const Text(
                    "Allowed",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          )),
    );
  }
}
