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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        Image.asset(
          "assets/logopedra.png",
          height: 70,
        ),
        Spacer(),
        // Column(
        //   children: [
        //     Text(
        //       "PEMILU CAKAHIM",
        //       style: TextStyle(
        //         fontSize: 22,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     Text(
        //       "PERIODE 2023",
        //       style: TextStyle(
        //         fontSize: 22,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ],
        // ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
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
