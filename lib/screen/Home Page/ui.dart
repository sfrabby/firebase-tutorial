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
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("FireBase", style: TextStyle(color: Colors.white, fontSize: 16),),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
