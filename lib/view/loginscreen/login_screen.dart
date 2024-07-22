import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/log_in_controller.dart';


class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Container(
               height: 300,
               width: 300,
               decoration: BoxDecoration(
                 image: DecorationImage(image: AssetImage('asset/img/logo.png'))
               ),
             ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                child: TextField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: loginController.emailError.value,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Obx(() => Text(
                loginController.emailError.value,
                style: TextStyle(color: Colors.red),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: loginController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: loginController.passwordError.value,
                  ),
                  obscureText: true,
                ),
              ),
              Obx(() => Text(
                loginController.passwordError.value,
                style: TextStyle(color: Colors.red),
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: loginController.login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
