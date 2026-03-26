import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignUpPage extends StatelessWidget {
  const PhoneSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: BackButton(color: Colors.black),), // পিছনে যাওয়ার জন্য
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                const Text(
                  "নতুন অ্যাকাউন্ট তৈরি করুন",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                const SizedBox(height: 10),
                const Text("আপনার তথ্য দিয়ে নিচের ফরমটি পূরণ করুন।"),
                const SizedBox(height: 40),

                // Name TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),

                // Phone Number TextField
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: "01XXXXXXXXX",
                    prefixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),

                // Password TextField
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // Sign Up করার পর কি হবে সেই লজিক
                    Get.snackbar("Success", "অ্যাকাউন্ট তৈরি সফল হয়েছে!",
                        backgroundColor: Colors.green.withOpacity(0.1),
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("সাইন আপ করুন", style: TextStyle(fontSize: 16)),
                ),

                const SizedBox(height: 20),

                // Login Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("আগে থেকেই অ্যাকাউন্ট আছে?"),
                    TextButton(
                      onPressed: () => Get.back(), // আগের লগইন পেজে নিয়ে যাবে
                      child: const Text("লগইন করুন"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}