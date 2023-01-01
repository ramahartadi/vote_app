import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_application/model/vote.dart';
import 'package:vote_application/pages/app_bar_logout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  String? _value = '';
  String? errorMessage = '';
  CollectionReference collectionReferenceUser =
      FirebaseFirestore.instance.collection("users");

  Future<void> addVote(Vote vote) {
    return collectionReferenceUser.doc(user?.uid).set({
      'id': vote.id,
      'email': vote.email,
      'value': vote.value,
    })
        // .then((value) => print("vote added"))
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

  Widget _userEmail() {
    return Text(user?.email ?? 'User');
  }

  Widget _signOutButton() {
    return TextButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      onPressed: () async {
        setState(() {
          if (_value == '') {
            errorMessage = "Vote terlebih dahulu";
          } else {
            var voteAdd =
                Vote(id: user?.uid, email: user?.email, value: _value);
            addVote(voteAdd);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text('Submit'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: _title(),
      //   foregroundColor: Colors.blue,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     _signOutButton(),
      //     SizedBox(
      //       width: 200,
      //     )
      //   ],
      // ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBarLogOut(),
            Spacer(),
            Column(
              children: [
                Text(
                  "PEMILU CAKAHIM",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "PERIODE 2023",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // _userEmail(),
            SizedBox(
              height: 30,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Spacer(),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => setState(() => _value = "satu"),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: _value == "satu"
                                      ? Image.asset(
                                          "assets/Nourut1abu.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.43,
                                        )
                                      : Image.asset(
                                          "assets/Nourut1.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                        ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              GestureDetector(
                                onTap: () => setState(() => _value = "dua"),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: _value == "dua"
                                      ? Image.asset(
                                          "assets/Nourut2abu.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.42,
                                        )
                                      : Image.asset(
                                          "assets/Nourut2.png",
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                        ),

                                  // Icon(
                                  //   Icons.person_outline,
                                  //   size: 200,
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),

                  // _userUid(),
                  SizedBox(
                    height: 5,
                  ),
                  AnimatedOpacity(
                    opacity: _value == '' ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          _userEmail(),
                          Text("vote nomor ${_value}")
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _submitButton(),
                  _errorMessage()
                ]),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
