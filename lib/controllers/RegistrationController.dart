import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registrationcontroller extends GetxController{
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController address=TextEditingController();
  var obscureText = true.obs;
    void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}