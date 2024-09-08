import 'package:get/get.dart';
import 'package:pharmasea/controllers/LoginController.dart';
import 'package:pharmasea/controllers/RegistrationController.dart';

class Loginbinding extends Bindings{
   @override
  void dependencies(){
    Get.lazyPut(()=>Logincontroller());
  }
}