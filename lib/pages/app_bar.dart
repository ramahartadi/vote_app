import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
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
        SizedBox(
          width: 20,
        ),
        Text(
          "HIMA GEOFISIKA PEDRA",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Spacer(),
        // ElevatedButton(
        //   style: ButtonStyle(
        //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(24),
        //         side: BorderSide(color: Colors.blue),
        //       ),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Text("Sign in"),
        //   ),
        // ),
      ]),
    );
  }
}
