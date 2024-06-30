// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:visitors/screens/departmentList.dart';
// import 'package:visitors/screens/provider/widgetprovider.dart';
// import 'package:visitors/screens/view_all_departmetns.dart';


// class ServicesDashBoard extends StatefulWidget {
//   const ServicesDashBoard({super.key});

//   @override
//   State<ServicesDashBoard> createState() => _ServicesDashBoardState();
// }

// class _ServicesDashBoardState extends State<ServicesDashBoard> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WidgetProvider>(context);
//     return Scaffold(
    
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Services"),),
//         backgroundColor: Color.fromARGB(255, 185, 185, 185),
//         body: Padding(
//           padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
//           child: GridView(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, crossAxisSpacing: 10, mainAxisExtent: 150),
//             children: [
//               InkWell(
//                   onTap: () {
//                     // popScreen(const CreateDepartmentPage());
//                                          provider.getSelectedWidget(ViewAllDepartment());

//                   },
//                   // child: ServiceCard().serviceCard(context,
//                   //     Icons.add_business_outlined, "Create Department")
//                       ),
//               InkWell(
//                   onTap: () {
//                   },
//                     // child: ServiceCard().serviceCard(
//                     //     context, Icons.co_present_outlined, "Roles/Position")
//                       ),
//               InkWell(
//                  onTap: () {
//                      provider.getSelectedWidget(DepartMenListtScreens());
//                   },
//                 // child: ServiceCard().serviceCard(
//                 //     context, Icons.supervised_user_circle, "Register User"),
//               ),
//               // ServiceCard().serviceCard(context, Icons.home_filled, "Service"),
//             ],
//           ),
//         ));
//   }

//   popScreen(Widget clickedScreen) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Container(
//                 width: MediaQuery.of(context).size.width / 3,
//                 height: MediaQuery.of(context).size.width / 3,
//                 child: Center(child: clickedScreen)),
//           );
//         });
//   }
// }
