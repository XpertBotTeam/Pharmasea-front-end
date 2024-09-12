import 'package:flutter/material.dart';
import '../navigationBar.dart';
import 'package:pharmasea/views/AboutPage.dart';
import 'package:pharmasea/views/trackOrderPage.dart';
import 'package:pharmasea/views/homePage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchQuery = ''; // To hold the user's search input
  int _selectedIndex = 1; // Default selected index for search

  // Simulated search data (replace with your actual data)
  final List<String> _data = [
    'Aspirin',
    'Paracetamol',
    'Ibuprofen',
    'Cough Syrup',
    'Vitamin C',
    'Antibiotics',
    'Pain Relief',
    'Antacids'
  ];

  List<String> _filteredResults = [];
 final List<Widget> _pages = [Homepage(), SearchPage(),Aboutpage(),Trackorderpage()];
  @override
  void initState() {
    super.initState();
    _filteredResults = _data; // Show all items by default
  }

  // Function to handle the search query
  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredResults = _data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Method to show a filter dialog (can be expanded as needed)
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter'),
          content: const Text('Filter options go here'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context); // Show the filter dialog on tap
            },
          ),
        ],
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
      // Gradient Body
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search for drugs...',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _updateSearchQuery,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredResults[index]),
                    onTap: () {
                      // You can navigate to a detail page or perform other actions on tap
                      print("Tapped on: ${_filteredResults[index]}");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
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
