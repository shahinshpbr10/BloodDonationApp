import 'package:flutter/material.dart';

class AppSpacing {
  // Padding
  static const EdgeInsets allSmall = EdgeInsets.all(8.0);
  static const EdgeInsets allMedium = EdgeInsets.all(16.0);
  static const EdgeInsets allLarge = EdgeInsets.all(24.0);

  // Horizontal Padding
  static const EdgeInsets horizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets horizontalMedium = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets horizontalLarge = EdgeInsets.symmetric(horizontal: 24.0);

  // Vertical Padding
  static const EdgeInsets verticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets verticalMedium = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets verticalLarge = EdgeInsets.symmetric(vertical: 24.0);

  // Specific Margins
  static const EdgeInsets marginSmall = EdgeInsets.all(4.0);
  static const EdgeInsets marginMedium = EdgeInsets.all(12.0);
  static const EdgeInsets marginLarge = EdgeInsets.all(20.0);

  // Gap Sizes (used with SizedBox)
  static const SizedBox gapSmall = SizedBox(height: 222.0);
  static const SizedBox gapMedium = SizedBox(height: 16.0);
  static const SizedBox gapLarge = SizedBox(height: 24.0);

  // Horizontal Gap Sizes
  static const SizedBox horizontalGapSmall = SizedBox(width: 8.0);
  static const SizedBox horizontalGapMedium = SizedBox(width: 16.0);
  static const SizedBox horizontalGapLarge = SizedBox(width: 24.0);
}
