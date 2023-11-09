import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_styles.dart';

Widget infoItem({required String icon, required String text}) {
  return Row(
    children: [
      Image.asset(
        icon,
        height: 24.h,
        width: 24.w,
      ),
      Text(
        text,
        style: AppStyles.infoStyle,
      ),
    ],
  );
}
