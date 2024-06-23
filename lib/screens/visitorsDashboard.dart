// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:visitors/screens/checkIn_CheckOut.dart';
// import 'package:visitors/screens/provider/widgetprovider.dart';
// import 'package:visitors/screens/toDayVisitors.dart';
// import 'package:visitors/screens/visitoRegistorPage.dart';
// import 'package:visitors/widget/smallCard.dart';


// class VisitorsDashBoard extends StatefulWidget {
//   const VisitorsDashBoard({super.key});

//   @override
//   State<VisitorsDashBoard> createState() => _VisitorsDashBoardState();
// }

// class _VisitorsDashBoardState extends State<VisitorsDashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WidgetProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                             backgroundColor: Colors.white,
//                             title: Text("Register New Visitor"),
//                             content: VisitorRegistor());
//                       });
//                 },
//                 child: Text("Registor Visitor")),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 100,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4, childAspectRatio: 5),
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       provider.getSelectedVisitors(AllTodayVisists());
//                     },
//                     child: SmallCard()
//                         .smal_card(context, "Today Visits", Colors.amberAccent),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       provider.getSelectedVisitors(
//                           CheckVistors().check_in_visitors(context));
//                     },
//                     child: SmallCard()
//                         .smal_card(context, "Check in Visitors", Colors.green),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       provider.getSelectedVisitors(
//                           CheckVistors().check_Out_visitors());
//                     },
//                     child: SmallCard()
//                         .smal_card(context, "Check Out Visitor", Colors.redAccent),
//                   ),
              
//                   SmallCard().smal_card(context, "Visitors", Colors.blueGrey),
//                 ],
//               ),
//             ),
//           ),
//           Divider(
//             thickness: 5,
//             color: Colors.grey,
//           ),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: provider.selectedVisitors,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
