import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Logincontroller extends GetxController{
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  var obscureText = true.obs;
   void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}