import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('UserDatils').doc('pima@g.com').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Center(child: Text("Document does not exist"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(color: Colors.orangeAccent[100]),
                child: Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              detailContainer(
                Icons.person,
                data['LastName'],
              ),
              Divider(),
              detailContainer(
                Icons.email,
                data['Email'],
              ),
                            Divider(),

              detailContainer(
                Icons.phone,
                data['PhoneNumber'],
              ),
                            Divider(),

               detailContainer(
                Icons.group,
                data['DepartmentName'],
              )
            ],
          );
        }

        return Center(child: CircularProgressIndicator(),);
      },
    ));
  }

  Widget detailContainer(IconData iconData, String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        child: Row(
          children: [
            Icon(iconData, size: 30, color: Colors.blueGrey),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}
