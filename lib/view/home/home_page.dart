import 'package:blood_donation_app/common/appcolors.dart';
import 'package:blood_donation_app/view/home/Widgets/donorListing.dart';
import 'package:blood_donation_app/view/home/Widgets/home_header.dart';
import 'package:flutter/material.dart';

import '../../common/apptextstyle.dart';
import 'Widgets/emergency_bllod_card.dart';

import 'Widgets/searchbar_with_filtter.dart';
import 'Widgets/service_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.11),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                ),
              ),
              child: Column(
                children: [
                  const HeaderWidget(),
                  buildSearchBar(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Emergency Requirement',
                      style: AppTextStyles.bodyText.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const EmergencyBloodCarousel(),
                    const SizedBox(height: 24),
                    buildServicesSection(),
                    const SizedBox(height: 26),
                    NearbyDonorsSection()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
