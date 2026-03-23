import 'package:flutter/material.dart';

class firebase extends StatefulWidget {
  const firebase({super.key});

  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green  ,
        centerTitle: true,
        title: Text(
          "FireBase",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Column(children: []),
    );
  }
}
