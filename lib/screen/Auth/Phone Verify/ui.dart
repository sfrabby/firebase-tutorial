import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class verification extends StatelessWidget {
  const verification({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController OTPController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phonelink_lock_rounded,
                size: 80,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),

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
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Phone Number Input
                  TextField(
                    controller: OTPController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "OTP",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          "Success",
                          "OTP verification completed",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.teal,
                          colorText: Colors.white,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Verify",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
