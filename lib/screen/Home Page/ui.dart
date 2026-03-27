import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/email_login/UI.dart';

class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {
  void LogOut() async {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LogOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("FireBase", style: TextStyle(fontSize: 16)),
      ),
      body: Column(children: []),
    );
  }
}
