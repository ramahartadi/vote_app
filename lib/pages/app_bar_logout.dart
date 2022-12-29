import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';

class CustomAppBarLogOut extends StatelessWidget {
  Widget _signOutButton() {
    return TextButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16),
            ),
          ]),
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "UNPAD",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          onPressed: () {
            signOut();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("Log out"),
          ),
        ),
      ]),
    );
  }
}
