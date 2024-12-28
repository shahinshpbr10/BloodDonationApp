import 'package:blood_donation_app/common/appcolors.dart';
import 'package:blood_donation_app/common/commontexts.dart';
import 'package:blood_donation_app/view/signin/signin_page.dart';
import 'package:blood_donation_app/view/splashscreen/home_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../common/apptextstyle.dart';
import '../../common/imageurl.dart';
import 'Widgets/bubble_circular_path.dart';
import 'Widgets/buildpages.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  double _currentPage = 0.0;

  // Bubble sizes
  final List<double> bubbleSizes = [40, 30, 50, 25, 35, 45];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _skipOnboarding() {
    // Add your navigation logic here
    // For example:
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Column(
            children: [
              // Top Section with Circular Bubbles
              Flexible(
                flex: 8,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          // Main Image in the Center
                          Align(
                            child: SizedBox(
                              height: screenWidth*1.9,
                              width: 240,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                child: Image.asset(AppImages.onboardingImage),
                              ),
                            ),
                          ),
                          // Circular Bubbles
                          Positioned.fill(
                            child: Stack(
                              children: List.generate(
                                bubbleSizes.length,
                                    (index) => CircularBubbleWidget(
                                  pageController: _pageController,
                                  radius: 150,
                                  angleOffset: index * (2 * pi / bubbleSizes.length),
                                  bubbleSize: bubbleSizes[index],
                                  color: index % 2 == 0 ? Colors.orange : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Description Section with Page Indicator
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: [
                          buildPage(
                            title: AppTexts.onboardingTitle1,context: context
                          ),
                          buildPage(
                            title: AppTexts.onboardingTitle2,context: context
                          ),
                          buildPage(
                            title: AppTexts.onboardingTitle3,
                            showButton: true,context: context
                          ),
                        ],
                      ),
                    ),
                    // Page Indicator
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                              (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            width: _currentPage.round() == index ? 24.0 : 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: _currentPage.round() == index
                                  ? Colors.black
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(
                                _currentPage.round() == index ? 4.0 : 4.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Skip Button - Only show if not on last page
          if (_currentPage.round() != 2) // Hide on page 3
            Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: _skipOnboarding,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Skip',
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}