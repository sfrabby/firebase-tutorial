import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Auth/email_login/UI.dart'; // আপনার লগইন স্ক্রিন পাথ

class FirebaseHome extends StatefulWidget {
  const FirebaseHome({super.key});

  @override
  State<FirebaseHome> createState() => _FirebaseHomeState();
}

class _FirebaseHomeState extends State<FirebaseHome> {
  // বর্তমান ইউজারের ডাটা গেট করা
  final user = FirebaseAuth.instance.currentUser;

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(" firebase Dashboard", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ১. টপ প্রোফাইল হেডার
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.teal),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    user?.displayName ?? "User Name",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    user?.email ?? "No Email Found",
                    style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ২. গ্রিড মেনু (বিভিন্ন অপশন)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildMenuCard(Icons.person_outline, "My Profile", Colors.blue),
                  _buildMenuCard(Icons.settings_outlined, "Settings", Colors.orange),
                  _buildMenuCard(Icons.notifications_none_rounded, "Alerts", Colors.purple),
                  _buildMenuCard(Icons.help_outline_rounded, "Support", Colors.green),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ৩. একটি সুন্দর ব্যানার কার্ড
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Colors.teal, Colors.tealAccent]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, color: Colors.white, size: 40),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Welcome to our premium community!",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // মেনু কার্ড বানানোর জন্য হেল্পার উইজেট
  Widget _buildMenuCard(IconData icon, String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}