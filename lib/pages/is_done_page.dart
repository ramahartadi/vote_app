import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_application/auth.dart';
import 'package:vote_application/pages/done.dart';
import 'package:vote_application/pages/home_page.dart';
import 'package:flutter/material.dart';

class IsDonePage extends StatefulWidget {
  const IsDonePage({Key? key}) : super(key: key);

  @override
  State<IsDonePage> createState() => _IsDonePageState();
}

class _IsDonePageState extends State<IsDonePage> {
  String userUid = Auth().currentUser!.uid;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  bool checkEmpty = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(userUid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.data()?.containsValue('value') == null) {
            checkEmpty = true;
          }
          if (snapshot.data?.data()?.containsKey('value') == null) {
            checkEmpty = true;
          }
          snapshot.data!.data()?.forEach((key, value) {
            if (key == 'value') {
              if (value == '') {
                checkEmpty = true;
              } else if (value == null) {
                checkEmpty = true;
              } else {
                checkEmpty = false;
                print('value');
              }
            }
          });
          return checkEmpty ? HomePage() : Done();
        } else if (snapshot.hasError) {
          return Text("Error");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
