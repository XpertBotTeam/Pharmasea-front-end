import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmasea/routes/Apppage.dart';
import 'package:pharmasea/routes/Approute.dart';
import 'package:pharmasea/views/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Approute.welcomescreen,
      getPages: Apppage.pages,
      home: Welcomescreen(),
      debugShowCheckedModeBanner: false,
     );
  }
}
