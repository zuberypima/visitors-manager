import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisitorDetails extends StatefulWidget {
  String phoneNumber;
  VisitorDetails({super.key, required this.phoneNumber});

  @override
  State<VisitorDetails> createState() => _VisitorDetailsState();
}

class _VisitorDetailsState extends State<VisitorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('VisitorsOfDepartment')
            .doc(widget.phoneNumber.toString())
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                visitor_detailed_container(
                    context,
                    ' ${data['FullName']}',
                    '${data['Email ']},',
                    ' ${data['PhoneNumber']}',
                    'Just a friend visit'),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.redAccent),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        child: Text("Reject Visit")),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.greenAccent),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () {},
                        child: Text("Accept Visit"))
                  ],
                )
              ],
            );
          }

          return Text("loading");
        },
      ),
    );
  }
}

Widget visitor_detailed_container(
    context, String fullmane, email, phone, reason) {
  return Container(
    // height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(
              width: 5,
            ),
            Text("Full Name:"),
            Text(fullmane)
          ],
        ),
        Row(
          children: [
            Icon(Icons.email),
            SizedBox(
              width: 5,
            ),
            Text("Email Address:"),
            Text(email)
          ],
        ),
        Row(
          children: [
            Icon(Icons.phone_android_sharp),
            SizedBox(
              width: 5,
            ),
            Text("Phone Number:"),
            Text(phone)
          ],
        ),
        Row(
          children: [
            Icon(Icons.real_estate_agent_outlined),
            SizedBox(
              width: 5,
            ),
            Text("Reason for Visit:"),
            Text(reason)
          ],
        )
      ],
    ),
  );
}
