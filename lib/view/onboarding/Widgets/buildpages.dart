import 'package:blood_donation_app/common/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/apptextstyle.dart';
import '../../signin/signin_page.dart';

Widget buildPage({
  required String title,


  bool showButton = false,
  required BuildContext context,
}) {
  return Column(
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.smallBodyText.copyWith(fontSize: 20, ),
      ),
      SizedBox(height: 8),

      if (showButton) ...[
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black,elevation: 0,foregroundColor: AppColors.primary),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started",style: AppTextStyles.bodyText.copyWith(color: AppColors.primary),),
                  SizedBox(width: 20,),
                  Icon(Iconsax.arrow_right_2,color: AppColors.primary,)
                ],
              ),
            ),
          ),
        ),
      ],
    ],
  );
}