import 'package:blood_donation_app/common/appcolors.dart';
import 'package:blood_donation_app/view/home/mainNavbar.dart';
import 'package:flutter/material.dart';

import '../../../common/apptextstyle.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SVG/Image
              Image.asset(
                'assets/images/png/afterdonate.png', // Replace with your image path
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 20),
              // Success Message
              Text(
                'Thank you',
                style: AppTextStyles.bodyText.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Success Description
              Text(
                'Your form has been successfully submitted. We’re reviewing your information and will contact you soon with the next step.',
                textAlign: TextAlign.center,
                style: AppTextStyles.smallBodyText.copyWith(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              // Outlined Button
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainNavigationPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide( width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'Go to Home',
                  style: AppTextStyles.smallBodyText.copyWith(

                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

