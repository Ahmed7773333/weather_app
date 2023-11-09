import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/features/home/presentation/bloc/home_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import 'info_item.dart';

Widget infoContainer(HomeCubit bloc) {
  return Positioned(
    top: 422.h,
    left: 40.w,
    right: 40.w,
    bottom: 389.h,
    child: Container(
      width: 343.w,
      height: 47.h,
      decoration: ShapeDecoration(
        color: AppColors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          infoItem(icon: AppImages.rain, text: '${bloc.cloud}%'),
          infoItem(icon: AppImages.temp, text: '${bloc.humidity}%'),
          infoItem(icon: AppImages.wind, text: '${bloc.windSpeed} km/h'),
        ],
      ),
    ),
  );
}
