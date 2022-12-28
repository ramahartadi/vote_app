import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  String _value = "null";

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.uid ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
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
                    child: Container(
                      color: _value == "siji" ? Colors.grey : Colors.orange,
                      child: Icon(Icons.call),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _value = "loro"),
                    child: Container(
                      color: _value == "loro" ? Colors.grey : Colors.orange,
                      child: Icon(Icons.message),
                    ),
                  ),
                  Spacer()
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _userUid(),
              _signOutButton(),
            ]),
      ),
    );
  }
}
