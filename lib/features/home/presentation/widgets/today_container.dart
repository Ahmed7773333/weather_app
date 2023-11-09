import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:weather_app/core/utils/app_styles.dart';
import 'package:weather_app/features/home/presentation/widgets/today_row.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';
import '../bloc/home_cubit.dart';

Widget todayContainer(HomeCubit bloc) {
  return Positioned(
      top: 489.h,
      left: 40.w,
      right: 40.w,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: Container(
          width: 343.w,
          height: 369.h,
          color: AppColors.onPrimary,
          child: Stack(
            children: [
              Positioned(
                top: 12.h,
                left: 16.w,
                child: Text(
                  'Today',
                  style: AppStyles.precipitationsStyle
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Positioned(
                top: 14.h,
                right: 18.w,
                child: Text(
                  '${DateFormat('MMM').format(DateTime.now())}, ${DateTime.now().day}',
                  style: AppStyles.precipitationsStyle,
                ),
              ),
              Positioned(
                top: 1.h,
                right: 140.w,
                left: 140.w,
                bottom: 333.h,
                child: SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: CachedNetworkImage(
                    imageUrl: 'https:${bloc.icon}', //icon from api
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                                Colors.transparent, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                  top: 61.h,
                  left: 20.w,
                  child: Column(
                    //informations from api
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      todayRow(
                          title: 'Pressure (mb)',
                          info: bloc.pressureMb.toString()),
                      todayRow(
                          title: 'Pressure (in)',
                          info: bloc.pressureIn.toString()),
                      todayRow(
                          title: 'Precipitation (mm)',
                          info: bloc.precipitationMm.toString()),
                      todayRow(
                          title: 'Precipitation (in)',
                          info: bloc.precipitationIn.toString()),
                      todayRow(title: 'Humidity', info: '${bloc.humidity}%'),
                      todayRow(title: 'Cloud Cover', info: '${bloc.cloud}%'),
                      todayRow(
                          title: 'Feels Like (°C)',
                          info: '${bloc.feelsLikeC}°C'),
                      todayRow(
                          title: 'Feels Like (°F)',
                          info: '${bloc.feelsLikeF}°F'),
                      todayRow(
                          title: 'Visibility (km)',
                          info: '${bloc.visibilityKm} km'),
                      todayRow(
                          title: 'Visibility (miles)',
                          info: '${bloc.visibilityMiles} miles'),
                      todayRow(title: 'UV Index', info: '${bloc.uVIndex}'),
                      todayRow(
                          title: 'Wind Gust (mph)',
                          info: '${bloc.gustMph} mph'),
                      todayRow(
                          title: 'Wind Gust (kph)',
                          info: '${bloc.gustKph} kph'),
                    ],
                  )),
            ],
          ),
        ),
      ));
}
