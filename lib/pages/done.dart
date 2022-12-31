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
            Container(
              width: 400,
              child: Text(
                'Terima kasih kepada akang teteh yang telah berpartisipasi dalam pemilihan Calon Ketua Himpunan Pedra kabinet 2023 🙏☺',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 400,
              child: Text(
                'Siapapun yang terpilih semoga dapat amanah dan memajukan Pedra kedepannya!!!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Spacer()
          ],
        )),
      ),
    );
  }
}
