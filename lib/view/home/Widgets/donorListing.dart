// donor_list_item.dart
import 'package:blood_donation_app/view/patientDetailsPage/patient_details_Page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/apptextstyle.dart';

class DonorListItem extends StatelessWidget {
  final String name;
  final String phone;
  final String distance;
  final String imageUrl;
  final  Function()? ontap;

  const DonorListItem({
    Key? key,
    required this.name,
    required this.phone,
    required this.distance,
    required this.imageUrl, this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            // Donor Image
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,color: Colors.grey,
                image: DecorationImage(

                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Donor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:  AppTextStyles.bodyText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ph: $phone',
                    style: AppTextStyles.smallBodyText.copyWith(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$distance away from you',
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Action Buttons
            Row(
              children: [
                Container(width: 40,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.05),
                    shape: BoxShape.circle

                ),
                  child: IconButton(
                    icon: const Icon(Iconsax.message),
                    onPressed: () {},
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 5,),
                Container(width: 40,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.05),
                      shape: BoxShape.circle

                  ),
                  child: IconButton(
                    icon: const Icon(Icons.phone_outlined),
                    onPressed: () {},
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class NearbyDonorsSection extends StatelessWidget {
  const NearbyDonorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nearby Donors',
              style: AppTextStyles.bodyText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey[600],
            ),
          ],
        ),

        Text(
          'donors with the same blood group near you.',
          style: AppTextStyles.smallBodyText.copyWith(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            DonorListItem(
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return PatientDetailsScreen();
                },));
              },
              name: 'Arun Kumar',
              phone: '+91 7654321098',
              distance: '4km',
              imageUrl: 'https://example.com/arun.jpg',
            ),
            DonorListItem(ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PatientDetailsScreen();
              },));
            },
              name: 'Lekha Menon',
              phone: '+91 8765432109',
              distance: '12km',
              imageUrl: 'https://example.com/lekha.jpg',
            ),
            // Add more donors as needed
          ],
        ),
      ],
    );
  }
}