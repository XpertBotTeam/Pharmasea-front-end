import "package:flutter/material.dart";
import 'package:pharmasea/models/pharmacy.dart';
import 'package:pharmasea/views/SearchPage.dart';
import 'package:pharmasea/views/homePage.dart';
import 'package:pharmasea/views/trackOrderPage.dart';
import '../navigationBar.dart';
class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  int _selectedIndex = 2; // Define _selectedIndex
  final List<Widget> _pages = [
    const Homepage(),
    const SearchPage(),
    const Aboutpage(),
    const Trackorderpage()
    // Add other pages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1976D2), // Dark blue
                Color(0xFF1976D2), // Lighter blue
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1976D2), // Light blue
              Colors.white,       // Fades to white
            ],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Pharmacy.Name, // Ensure this matches the actual static property name
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(Pharmacy.Email), // Ensure these match the actual static property names
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone Number'),
              subtitle: Text(Pharmacy.phoneNumber),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              subtitle: Text(Pharmacy.Location),
            ),
            const Spacer(),
            const Center(
              child: Text(
                'Thank you for choosing us!',
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          // Navigate to the respective page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[_selectedIndex]),
          );
        },
      ),
    );
  }
}
