import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passwordControler = TextEditingController();
  final showPassword = true.obs;
  
  @override
  void onClose(){
    emailController.dispose();
    passwordControler.dispose();
    super.onClose();
  }

  void togglePasswordView(){
    showPassword.value = !showPassword.value;
  }
}