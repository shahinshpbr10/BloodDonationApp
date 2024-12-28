import 'package:blood_donation_app/view/home/Widgets/service_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/apptextstyle.dart';

Widget buildServicesSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Text(
        'Services',
        style: AppTextStyles.bodyText.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          buildServiceCard(
            'Nearby Blood',
            'Some short description of this type of report.',
            Icons.location_on,
            Colors.purple.shade100,
            () {

            },
          ),
          buildServiceCard(
            'Request blood',
            'Some short description of this type of report.',
            Icons.opacity,
            Colors.blue.shade100,
                () {

            },
          ),
          buildServiceCard(
            'Blood Bank',
            'Some short description of this type of report.',
            Icons.local_hospital,
            Colors.red.shade100,
                () {

            },
          ),
        ],
      ),
    ],
  );
}