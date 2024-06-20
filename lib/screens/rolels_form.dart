// import 'package:flutter/material.dart';
// import 'package:visitors2023/widget/formOne.dart';
// import 'package:visitors2023/widget/utils/dimensions.dart';

// // ignore: must_be_immutable
// class RolesandPostionForm extends StatefulWidget {
//   RolesandPostionForm({super.key});

//   @override
//   State<RolesandPostionForm> createState() => _RolesandPostionFormState();
// }

// TextEditingController _positionName = TextEditingController();
// TextEditingController _deparmentName = TextEditingController();

// class _RolesandPostionFormState extends State<RolesandPostionForm> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 3,
//       // height: 200,
//       child: ListView(
//         children: [
//           Divider(),
//           formFieldOne(context, "Role/Position Name", _positionName),
//           SizedBox(height: Dimensions.height20(context)),
//           ElevatedButton(
//               style: ButtonStyle(
//                   foregroundColor: MaterialStatePropertyAll(
//                     Colors.white,
//                   ),
//                   backgroundColor:
//                       MaterialStatePropertyAll<Color>(Colors.amber)),
//               onPressed: () {},
//               child: Text("Register")),
//           const SizedBox(width: 20),
//         ],
//       ),
//     );
//   }
// }
