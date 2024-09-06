import 'package:flutter/material.dart';
import 'package:pharmasea/welcomescreen-3.dart';
import 'package:pharmasea/welcomescreen.dart';
import 'welcomescreen-2.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Lastwelcomescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
