import 'package:get/get.dart';
import 'package:pharmasea/routes/Approute.dart';
import 'package:pharmasea/views/login.dart';
import 'package:pharmasea/views/registration.dart';
import 'package:pharmasea/views/welcomescreen-2.dart';
import 'package:pharmasea/views/welcomescreen-3.dart';
import 'package:pharmasea/views/welcomescreen.dart';
class Apppage{
  static final List <GetPage> pages=[
    GetPage(name: Approute.welcomescreen, page: ()=>Welcomescreen()),
    GetPage(name: Approute.welcomescreen2, page: ()=>Secondwelcomescreen()),
    GetPage(name: Approute.welcomescreen3, page: ()=>Lastwelcomescreen()),
    GetPage(name: Approute.registration, page: ()=>Registration()),
    GetPage(name: Approute.login, page: ()=>Login())

  ];
}