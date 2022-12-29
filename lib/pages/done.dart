import 'package:flutter/material.dart';
import 'package:vote_application/auth.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);
  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
            child: Column(
          children: [Spacer(), Text('Sudah Isi'), _signOutButton(), Spacer()],
        )),
      ),
    );
  }
}
