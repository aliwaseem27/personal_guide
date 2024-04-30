import 'package:personal_guide/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: AppSizes.appBarHeight,
    bottom: AppSizes.defaultSpace,
    left: AppSizes.defaultSpace,
    right: AppSizes.defaultSpace,
  );
}