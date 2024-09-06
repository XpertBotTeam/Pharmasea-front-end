import 'package:flutter/material.dart';
import 'package:pharmasea/views/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcomescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
