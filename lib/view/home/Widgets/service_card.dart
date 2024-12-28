import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/apptextstyle.dart';

Widget buildServiceCard(String title,String subtitle, IconData icon, Color color, void Function() ontap) {
  return InkWell(onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.start,
            style:  AppTextStyles.bodyText.copyWith(

            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style:  AppTextStyles.caption.copyWith(
              fontSize: 10,

            ),
          ),
        ],
      ),
    ),
  );
}