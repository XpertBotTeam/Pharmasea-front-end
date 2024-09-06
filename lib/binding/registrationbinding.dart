import 'package:get/get.dart';
import 'package:pharmasea/controllers/RegistrationController.dart';

class Registrationbinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>Registrationcontroller());
  }
}