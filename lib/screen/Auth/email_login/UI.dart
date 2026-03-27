import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../email_signup/UI.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // টেক্সট ফিল্ডের ডাটা ধরার জন্য কন্ট্রোলার
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void Login ()async{
    String email = emailController.text.trim();
    String pass = passwordController.text.trim();

    if(pass == "" || email == ""){
      Get.snackbar("Warning ", "Inter Your Email & Pass");
    }
    else{
      
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    }

}

  bool isPasswordVisible = false; // পাসওয়ার্ড লুকানো বা দেখানোর জন্য

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 100),

              // লোগো বা আইকন
              const Icon(Icons.lock_person_rounded, size: 100, color: Colors.teal),
              const SizedBox(height: 30),

              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const Text(
                "Login to your account",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 50),

              // ১. Email TextField
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: "Email Address",
                  hintText: "example@mail.com",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),

              const SizedBox(height: 20),

              // ২. Password TextField
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible, // পাসওয়ার্ড হাইড রাখবে
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),

              const SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: Colors.teal)),
                ),
              ),

              const SizedBox(height: 30),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    // লগইন লজিক এখানে হবে
                    String email = emailController.text;
                    String pass = passwordController.text;

                    if(email.isEmpty || pass.isEmpty) {
                      Get.snackbar("Error", "Please fill all fields",
                          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent, colorText: Colors.white);
                    } else {
                      print("Login with: $email");
                    }
                  },
                  child: const Text("LOGIN", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 20),

              // Don't have an account?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpScreen()); // '=>' ব্যবহার করলে এটি স্ক্রিনটি রিটার্ন করে
                    },
                    child: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
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