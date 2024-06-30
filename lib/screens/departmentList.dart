// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:visitors/screens/provider/widgetprovider.dart';
// import 'package:visitors/screens/staff_List_screen.dart';


// class DepartMenListtScreens extends StatefulWidget {
//   const DepartMenListtScreens({Key? key});

//   @override
//   State<DepartMenListtScreens> createState() => _DepartMenListtScreensState();
// }

// class _DepartMenListtScreensState extends State<DepartMenListtScreens> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<WidgetProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Available Departments"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('Department').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           // Map the data from the snapshot to create grid items
//           final List<Map<String, dynamic>> data =
//               snapshot.data!.docs.map((DocumentSnapshot document) {
//             return document.data()! as Map<String, dynamic>;
//           }).toList();

//           return GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 5,
//                 crossAxisSpacing: 5,
//                 mainAxisExtent: 120,
//                 childAspectRatio: 8),
//             itemCount: data.length,
//             itemBuilder: (BuildContext context, int index) {
//               return InkWell(
//                 onTap: () {
//                   provider.getSelectedWidget(StaffListScreen(
//                     selectedDepartment: data[index]['Department'].toString(),
//                   ));
//                 },
//                 child: Card(
//                   child: Center(child: Text(data[index]['Department'])),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
