// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class StaffDropDownMenu {
// Widget staffDropDownmenu() {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(border: Border.all()),
//       child: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("staffs").snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }
      
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading");
//           }
      
//           List<DropdownMenuItem> dropMenuItems = [];
//           final dropItems = snapshot.data!.docs.reversed.toList();
      
//           for (var item in dropItems) {
//             dropMenuItems.add(DropdownMenuItem(
            
//               child: Text(item["fullName"])));
//           }
//           return DropdownButton(
//             hint: Text("Select Staff "),
            
//             items: dropMenuItems, onChanged: (Value) {});
//         },
//       ),
//     );
//   }
// }
