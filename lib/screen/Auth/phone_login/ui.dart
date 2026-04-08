import 'dart:developer';

import 'package:fbase/screen/Auth/Phone%20Verify/ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController phoneController = TextEditingController();
  bool isPasswordVisible = false;

  void OTP (){
    String Phone = "+88"+phoneController.text.trim();

   FirebaseAuth.instance.verifyPhoneNumber(
       phoneNumber: Phone,

       verificationCompleted: (credential){},
       verificationFailed: (ex){log(ex.code.toString());},
       codeSent: (verificationId, resendToken){

         Get.offAll(() => verification());

       },
       codeAutoRetrievalTimeout: (verificationId){},
       timeout: Duration(seconds: 60)
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // হালকা ব্যাকগ্রাউন্ড
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // উপরের আইকন এবং টেক্সট
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.phonelink_lock_rounded, size: 80, color: Colors.teal),
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              const Text(
                "Login to your account",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // মেইন ইনপুট কার্ড
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    // Phone Number Input
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Text("+880 ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Forgot Password

              const SizedBox(height: 30),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Success", "লগইন করা হচ্ছে...",
                        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.teal, colorText: Colors.white);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                  ),
                  child: const Text("LOG IN", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),

              const SizedBox(height: 25),

              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Register Page
                    },
                    child: const Text("SignUP", style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}