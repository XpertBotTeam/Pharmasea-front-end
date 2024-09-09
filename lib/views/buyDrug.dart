import 'package:flutter/material.dart';
import 'package:pharmasea/models/drug.dart';
import 'package:pharmasea/models/pharmacy.dart';

class BuyDrug extends StatelessWidget {
  final Drug drug;

  const BuyDrug({Key? key, required this.drug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(drug.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              drug.Image,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              drug.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: \$${drug.price}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Company: ${drug.company}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${drug.infoDescription}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Expiry Date: ${drug.expiryDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            drug.prescriptionIsRequired
                ? Column(
                  children: [
                    Text(
                    
                    'Prescription Required Please send your prescription to the following number ${Pharmacy.phoneNumber} after clicking on the confirmation button',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 2, // Responsive padding
                          horizontal: 25, // Responsive width
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 25,color: Colors.black), // Responsive text
                      ),
                    ),
                  ),
                  ]
                )
                :  Column(
                  children: [
                    Text(
                    'NO Prescription Required Just click on the confirmation button ',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 2, // Responsive padding
                          horizontal: 25, // Responsive width
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 25,color: Colors.black), // Responsive text
                      ),
                    ),
                  ),
                  ]
                )

          ],
        ),
      ),
    );
  }
}
