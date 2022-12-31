import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vote_application/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vote_application/pages/app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  final _fireCloud = FirebaseFirestore.instance.collection("users");

  bool obscurePassword = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }

  Widget _entryPasswordField(
    String title,
    TextEditingController controller,
  ) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.white,
          ),
          tooltip: 'Delete',
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
        ),
      ),
      obscureText: obscurePassword,
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Center(
          child: Text(
        isLogin ? 'Login' : 'Register',
        style: TextStyle(color: Colors.red[900]),
      )),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: _title(),
      // ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            CustomAppBar(),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "PEMILU CAKAHIM",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "PERIODE 2023",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'kpupedra.jpeg',
                        height: 200,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          _entryField('email', _controllerEmail),
                          SizedBox(
                            height: 10,
                          ),
                          _entryPasswordField('password', _controllerPassword),
                          SizedBox(height: 20),
                          _errorMessage(),
                          _submitButton(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            // _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
