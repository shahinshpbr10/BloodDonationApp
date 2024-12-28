import 'package:blood_donation_app/common/apptextstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: TextField(
      style: AppTextStyles.smallBodyText,
      decoration: InputDecoration(
        hintText: 'Search for people nearby',
        prefixIcon: const Icon(Iconsax.search_normal),
        suffixIcon: IconButton(icon:Icon(Iconsax.filter), onPressed: () {  },),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    ),
  );
}