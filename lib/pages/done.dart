import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';
import 'package:vote_application/pages/app_bar_logout.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);
  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Log Out'),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        child: Center(
            child: Column(
          children: [
            CustomAppBarLogOut(),
            Spacer(),
            Text(
              'Sudah Isi',
              style: TextStyle(fontSize: 30),
            ),
            Spacer()
          ],
        )),
      ),
    );
  }
}
