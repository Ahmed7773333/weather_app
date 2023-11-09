import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_styles.dart';

Widget todayRow({required String title, required String info}) {
  return SizedBox(
    width: 300.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.precipitationsStyle,
        ),
        Text(
          info,
          style: AppStyles.precipitationsStyle,
        ),
      ],
    ),
  );
}
