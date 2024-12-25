import 'package:blood_donation_app/common/appsizes.dart';
import 'package:blood_donation_app/common/imageurl.dart';
import 'package:blood_donation_app/view/splashscreen/nextpage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Set a 0.5 second delay to navigate to another page
    Future.delayed(const Duration(milliseconds: 2000), () {
      // Navigate to the next screen (replace SplashPage with your next page)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Replace with your next page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // Screen width

    return Scaffold(
      backgroundColor: Colors.white,
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
              // Title and Subtitle Section
              Column(
                children: [
                  const Text(
                    "Blood Donation", // Title
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(
                      height: 10), // Spacing between title and subtitle
                  const Text(
                    "Donate, track &\nsave lives", // Subtitle
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  height: 120), // Uniform spacing after title and subtitle

              // Image Section
              Image.asset(
                AppImages.first, // PNG from common class
                width: width * 0.6, // 60% of screen width
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 90), // Uniform spacing after image

              // Description Section
              const Text(
                "We provide you the easy way to\naccess blood bank",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(
                  height: 30), // Uniform spacing below description (if needed)
            ],
          ),
        ),
      ),
    );
  }
}
