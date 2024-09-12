import 'package:flutter/material.dart';
import 'package:pharmasea/models/drug.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmasea/views/AboutPage.dart';
import 'package:pharmasea/views/SearchPage.dart';
import 'package:pharmasea/views/buyDrug.dart';
import 'package:pharmasea/views/trackOrderPage.dart';
import '../navigationBar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _filterOption = 'All'; // Default filter option
  String _selectedCategory = 'All'; // Default category filter
  int _selectedIndex = 0; // To manage the selected bottom navigation index
  final List<Widget> _pages = [Homepage(), SearchPage(),Aboutpage(),Trackorderpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0D47A1), // Dark blue
                Color(0xFF1976D2), // Lighter blue
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog(context); // Show the filter dialog on tap
            },
          ),
        ],
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Shop By Category",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = 'All';
                        });
                      }, // Clear the category filter
                      child: const Text("See All"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50, // Height of the horizontal category list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryItem('heart', 'Heart Drug', FontAwesomeIcons.heart),
                    _buildCategoryItem('lung', 'Lung Drug', FontAwesomeIcons.lungs),
                    _buildCategoryItem('eye', 'Eye Drug', Icons.visibility_outlined),
                  ],
                ),
              ),
              
              // Recommended Products Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Recommend for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Three columns
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9, // Aspect ratio for the grid items
                ),
                itemCount: _getFilteredDrugsByCategory().length,
                itemBuilder: (context, index) {
                  final drug = _getFilteredDrugsByCategory()[index];
                  return _buildProductCard(drug);
                },
              ),
            ],
          ),
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

  // Helper widget for building a category item
  Widget _buildCategoryItem(String category, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategory = category;
          });
        },
        child: Chip(
          avatar: Icon(icon, color: Colors.white),
          label: Text(label, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.redAccent, // Customize as per design
        ),
      ),
    );
  }

  // Helper widget for building a product card
  Widget _buildProductCard(Drug drug) {
    return GestureDetector(
      onTap: () {
        // Navigate to BuyDrug page when a drug is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BuyDrug(drug: drug),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  drug.Image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                drug.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${drug.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      _showDrugDetails(drug); // Show drug details when tapped
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show drug details in a dialog
  void _showDrugDetails(Drug drug) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(drug.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price: \$${drug.price}'),
              Text('Company: ${drug.company}'),
              Text('Expiry Date: ${drug.expiryDate}'),
              Text('Description: ${drug.infoDescription}'),
              Text('Prescription Required: ${drug.prescriptionIsRequired ? "Yes" : "No"}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to filter drugs based on both the selected category and prescription filter
  List<Drug> _getFilteredDrugsByCategory() {
    List<Drug> filteredDrugs = drugList;

    // Apply category filter
    if (_selectedCategory != 'All') {
      filteredDrugs = filteredDrugs.where((drug) => drug.category == _selectedCategory).toList();
    }

    // Apply prescription filter
    if (_filterOption == 'Prescription Required') {
      filteredDrugs = filteredDrugs.where((drug) => drug.prescriptionIsRequired).toList();
    } else if (_filterOption == 'No Prescription') {
      filteredDrugs = filteredDrugs.where((drug) => !drug.prescriptionIsRequired).toList();
    }

    return filteredDrugs;
  }

  // Function to show the filter dialog with radio buttons
  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Drugs'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('All Drugs'),
                value: 'All',
                groupValue: _filterOption,
                onChanged: (value) {
                  setState(() {
                    _filterOption = value!;
                    Navigator.of(context).pop(); // Close the dialog
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Prescription Required'),
                value: 'Prescription Required',
                groupValue: _filterOption,
                onChanged: (value) {
                  setState(() {
                    _filterOption = value!;
                    Navigator.of(context).pop(); // Close the dialog
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('No Prescription'),
                value: 'No Prescription',
                groupValue: _filterOption,
                onChanged: (value) {
                  setState(() {
                    _filterOption = value!;
                    Navigator.of(context).pop(); // Close the dialog
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
