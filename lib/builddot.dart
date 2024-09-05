import 'package:flutter/material.dart';
class BuildDot extends StatelessWidget {
  final  bool isActive;
  final  double screenWidth;
 const BuildDot({super.key,required this.isActive, required  this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01), 
      width: isActive ? screenWidth * 0.03 : screenWidth * 0.025,
      height: isActive ? screenWidth * 0.03 : screenWidth * 0.025,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}