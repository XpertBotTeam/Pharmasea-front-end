import 'package:flutter/material.dart';
import 'package:pharmasea/models/drug.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _filterOption = 'All'; // Default filter option

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: _getFilteredDrugs().length,
            itemBuilder: (context, index) {
              final drug = _getFilteredDrugs()[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            drug.Image,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                drug.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Price: \$${drug.price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Expiry Date: ${drug.expiryDate}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                drug.prescriptionIsRequired
                                    ? 'Prescription required'
                                    : 'No prescription required',
                                style: TextStyle(
                                  color: drug.prescriptionIsRequired
                                      ? Colors.red
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            _showDrugDetails(context, drug);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
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
                title: const Text('No Prescription Required'),
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

  // Function to filter drugs based on the selected option
  List<Drug> _getFilteredDrugs() {
    if (_filterOption == 'All') {
      return drugList;
    } else if (_filterOption == 'Prescription Required') {
      return drugList.where((drug) => drug.prescriptionIsRequired).toList();
    } else {
      return drugList.where((drug) => !drug.prescriptionIsRequired).toList();
    }
  }

  // Function to display drug details in a dialog
  void _showDrugDetails(BuildContext context, Drug drug) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(drug.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(drug.Image, width: 100, height: 100),
              const SizedBox(height: 10),
              Text('Price: \$${drug.price}'),
              Text('Expiry Date: ${drug.expiryDate}'),
              Text('Company: ${drug.company}'),
              const SizedBox(height: 10),
              Text('Description: ${drug.infoDescription}'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
