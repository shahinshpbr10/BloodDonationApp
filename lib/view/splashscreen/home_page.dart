import 'package:blood_donation_app/common/appsizes.dart';
import 'package:blood_donation_app/common/imageurl.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // Screen width

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 60), // Uniform horizontal padding
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Welcome Message Section
              Column(
                children: [
                  const Text(
                    "Welcome to Blood Donation", // Main Title
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Spacing between title and subtitle
                  const Text(
                    "Donate, track & save lives", // Subtitle
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Spacing after title and subtitle

              // Image Section
              Image.asset(
                AppImages.afterdonate, // PNG from common class
                width: width * 0.6, // 60% of screen width
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 50), // Spacing after image

              // Description Section
              const Text(
                "We provide you an easy way to access blood banks and donate easily.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 40), // Uniform spacing below description

              // Action Buttons (Example: Donate, Request Blood)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to donate page
                      // Example: Navigator.push(...)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Red button for donation
                    ),
                    child: const Text("Donate Blood"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation to request blood page
                      // Example: Navigator.push(...)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Green button for request blood
                    ),
                    child: const Text("Request Blood"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
