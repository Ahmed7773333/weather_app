import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_colors.dart';

class AppTheme {
  static ThemeData mode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.onPrimary)),
      fillColor: AppColors.primary,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.onPrimary)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: AppColors.onPrimary)),
    ),
  );
}
