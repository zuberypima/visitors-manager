// import 'package:flutter/material.dart';
// import 'package:visitors/screens/authscreens/adminiAuthScreen.dart';
// import 'package:visitors/services/auth_services.dart';


// class OrgnizationRegister extends StatefulWidget {
//   const OrgnizationRegister({super.key});

//   @override
//   State<OrgnizationRegister> createState() => _OrgnizationRegisterState();
// }

// TextEditingController _orName = TextEditingController();
// TextEditingController _brelaNumber = TextEditingController();
// TextEditingController _emailAddress = TextEditingController();
// TextEditingController _password = TextEditingController();

// bool _isLoading = false;

// void clearContorler() {
//   _orName.clear();
//   _brelaNumber.clear();
//   _emailAddress.clear();
//   _password.clear();
// }

// class _OrgnizationRegisterState extends State<OrgnizationRegister> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: const Color.fromARGB(108, 0, 187, 212),
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         actions: [
//           InkWell(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => AdministratorAuthScreen(
//                           userLogedIn: "Administrator",
//                         )));
//               },
//               child: const Padding(
//                 padding: const EdgeInsets.only(right: 30),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.person,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       "Administrator",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               "Register an Organization in  VisitorApp",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 34,
//                   fontStyle: FontStyle.italic),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width / 3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 45,
//                       child: TextFormField(
//                         controller: _orName,
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Organizitaio Name",
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             )),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             ))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 45,
//                       child: TextFormField(
//                         controller: _brelaNumber,
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Brela Reg.",
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             )),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             ))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 45,
//                       child: TextFormField(
//                         controller: _emailAddress,
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Email Address",
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             )),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             ))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 45,
//                       child: TextFormField(
//                         controller: _password,
//                         obscureText: true,
//                         decoration: const InputDecoration(
//                             fillColor: Colors.white,
//                             filled: true,
//                             hintText: "Password",
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             )),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                               color: Colors.black,
//                             ))),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                         style: ButtonStyle(
//                             foregroundColor:
//                                 WidgetStatePropertyAll<Color>(Colors.black),
//                             backgroundColor: WidgetStatePropertyAll<Color>(
//                               Colors.amber,
//                             )),
//                         onPressed: () {
//                           loadingBox(context);
//                           AuthenticationServices().create_organization_account(
//                               _orName.text,
//                               _brelaNumber.text,
//                               _emailAddress.text,
//                               _password.text);
//                         },
//                         child: Center(
//                           child: Text("Register"),
//                         ))
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   void loadingBox(BuildContext context, [bool mounted = true]) async {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (_) {
//         return Dialog(
//           backgroundColor: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: const [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 15),
//                 Text('Loading...'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     // Simulate an asynchronous computation (replace with your actual logic)
//     await Future.delayed(const Duration(seconds: 3));
//     if (!mounted) return;

//     Navigator.of(context).pop();
//     confirmationBox();
//   }

//   void confirmationBox() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Text("Registration Successful"),
//             actions: [
//               ElevatedButton(
//                   onPressed: () {
//                     clearContorler();
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("OK"))
//             ],
//           );
//         });
//   }
// }
