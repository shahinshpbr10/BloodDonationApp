import 'package:blood_donation_app/common/appsizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // Get screen width
    final height = MediaQuery.of(context).size.height; // Get screen width
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/undraw_order-flowers_81uq.svg',
                  width: width*0.2 , // Use 60% of screen width
                  height: height,        // Fixed height (optional)
                  fit: BoxFit.contain,
                  semanticsLabel: 'Onboarding Image', // Accessibility label
                  placeholderBuilder: (context) => CircularProgressIndicator(), // Loading indicator
                ),
                AppSpacing.gapSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Hello Blood"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
