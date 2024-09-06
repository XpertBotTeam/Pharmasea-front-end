import 'package:flutter/material.dart';
import '../builddot.dart';

class  Lastwelcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait = screenHeight > screenWidth;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Image, title, and description
                  Column(
                    children: [
                      Image.asset(
                        'img/medical-products.png',
                        height: isPortrait
                            ? screenHeight * 0.25
                            : screenHeight * 0.4, // Adjust based on orientation
                        width: isPortrait
                            ? screenWidth * 0.6
                            : screenWidth * 0.4, // Adjust based on orientation
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Main title
                      Text(
                        'get your medical products instantly',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Description text
                      Text(
                        'your products are delivered home safely and securely',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BuildDot(isActive: false, screenWidth: screenWidth),
                      BuildDot(isActive: false, screenWidth: screenWidth),
                      BuildDot(isActive: true, screenWidth: screenWidth),
                    ],
                  ),

                  // Next button
                  Container(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.05),
                    child: ElevatedButton(
                      onPressed: () {
                        // Add next functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02, // Responsive padding
                          horizontal: screenWidth * 0.25, // Responsive width
                        ),
                      ),
                      child: Text(
                        'Finish',
                        style: TextStyle(fontSize: screenWidth * 0.045), // Responsive text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
