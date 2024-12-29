import 'package:blood_donation_app/view/home/home_page.dart';
import 'package:blood_donation_app/view/home/mainNavbar.dart';
import 'package:blood_donation_app/view/onboarding/onboarding_page.dart';
import 'package:blood_donation_app/view/otpscreen/otp_verification_page.dart';
import 'package:blood_donation_app/view/patientDetailsPage/patient_details_Page.dart';
import 'package:blood_donation_app/view/requestpage/bloodrequestpage.dart';

import 'package:blood_donation_app/view/signin/signin_page.dart';
import 'package:blood_donation_app/view/signup/signuppage.dart';
import 'package:blood_donation_app/view/splashscreen/splashpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
