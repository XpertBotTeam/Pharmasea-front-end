import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'views/AboutPage.dart';
import 'views/trackOrderPage.dart';
import 'views/homePage.dart';
import 'views/SearchPage.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  final int currentIndex;
  final Function(int) onTap;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.blue, // Change to the color you want
      selectedItemColor: Colors.blue, // Color of selected item
      unselectedItemColor: Colors.grey, // Color of unselected items
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.box),
          label: 'Track Order',
          backgroundColor: Colors.blue
        ),
      ],
    );
  }
}
