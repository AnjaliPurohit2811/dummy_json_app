import 'package:dummy_json_app/view/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Define text editing controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Define error messages
  var emailError = ''.obs;
  var passwordError = ''.obs;

  // Define validators
  bool validateEmail(String email) {
    if (email.isEmpty) {
      emailError.value = 'Email is required';
      return false;
    } else if (!email.contains('@gmail.com')) {
      emailError.value = 'Email must be a valid @gmail.com address';
      return false;
    } else {
      emailError.value = '';
      return true;
    }
  }

  bool validatePassword(String password) {
    if (password.isEmpty) {
      passwordError.value = 'Password is required';
      return false;
    } else if (password.length < 8) {
      passwordError.value = 'Password must be at least 8 characters';
      return false;
    } else {
      passwordError.value = '';
      return true;
    }
  }

  // Validate the form
  bool validateForm() {
    final isEmailValid = validateEmail(emailController.text);
    final isPasswordValid = validatePassword(passwordController.text);
    return isEmailValid && isPasswordValid;
  }

  // Handle login action
  void login() {
    if (validateForm()) {
      // Perform login action
      Get.to(HomeScreen());
    } else {
      // Display error messages
      Get.snackbar('Error', 'Please correct the errors');
    }
  }

  // // Dispose controllers when not needed
  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
}
