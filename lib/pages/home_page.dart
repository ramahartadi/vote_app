import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_application/model/vote.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  String? _value;
  CollectionReference collectionReferenceUser =
      FirebaseFirestore.instance.collection("users");

  Future<void> addVote(Vote vote) {
    return collectionReferenceUser
        .doc(user?.uid)
        .set({
          'id': vote.id,
          'email': vote.email,
          'value': vote.value,
        })
        .then((value) => print("vote added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text(user?.uid ?? 'Vote');
  }

  Widget _userUid() {
    return Text(user?.uid ?? 'User');
  }

  Widget _signOutButton() {
    return TextButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          var voteAdd = Vote(id: user?.uid, email: user?.email, value: _value);
          addVote(voteAdd);
        });
      },
      child: const Text('Submit'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _signOutButton(),
          SizedBox(
            width: 200,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () => setState(() => _value = "siji"),
                    child: Card(
                      color: _value == "siji" ? Colors.grey : Colors.blue,
                      child: Icon(
                        Icons.person,
                        size: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _value = "loro"),
                    child: Card(
                      color: _value == "loro" ? Colors.grey : Colors.blue,
                      child: Icon(
                        Icons.person_outline,
                        size: 200,
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // _userUid(),
              SizedBox(
                height: 10,
              ),
              _submitButton(),
            ]),
      ),
    );
  }
}
