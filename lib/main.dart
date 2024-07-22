import 'package:dummy_json_app/view/homescreen/home_screen.dart';
import 'package:dummy_json_app/view/loginscreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/cart_controller.dart';
import 'helper/api_service.dart';

void main(){
  final ApiService apiService = ApiService();
  Get.put(CartController(apiService));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
