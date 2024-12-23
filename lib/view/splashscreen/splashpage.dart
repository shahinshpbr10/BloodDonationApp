import 'package:blood_donation_app/common/appsizes.dart';
import 'package:blood_donation_app/common/imageurl.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // Screen width
    final height = MediaQuery.of(context).size.height; // Screen height

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Section
            const Text(
              "Blood Donotion",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle Section
            const Text(
              "Donate, track &\nsave lives",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // PNG Image
            Image.asset(
              AppImages.first, // PNG from common class
              width: width * 0.6, // 60% of screen width
              height: height * 0.3, // 30% of screen height
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "we provide you the easy way to\naccess blood bank",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Spacer for alignment
            AppSpacing.gapSmall,
          ],
        ),
      ),
    );
  }
}
