import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';
import 'package:weather_app/core/utils/app_images.dart';
import 'package:weather_app/core/utils/app_styles.dart';
import 'package:weather_app/core/utils/components.dart';
import 'package:weather_app/features/home/data/datasources/home_remote.dart';
import 'package:weather_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/info_container.dart';
import 'package:weather_app/features/home/presentation/widgets/today_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Components.background(
      child: BlocProvider(
        create: (context) => HomeCubit(HomeRemote())..getWeatherData(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeLoading) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  )),
                ),
              );
              debugPrint('loading');
            } else if (state is HomeError) {
              debugPrint('eror');
            } else if (state is HomeSuccess) {
              Navigator.pop(context);
              debugPrint('working');
            } else if (state is ChangeCityState) {
              Navigator.pop(context);

              HomeCubit.get(context).getWeatherData();
              debugPrint('changed');
            }
          },
          builder: (context, state) {
            final bloc = HomeCubit.get(context);
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Positioned(
                    top: 44.h,
                    left: 200.w,
                    child: SizedBox(
                      height: 50.h,
                      width: 210.w,
                      child: Center(
                        child: TextField(
                          style: AppStyles.dropDownStyle,
                          controller: bloc.searchController,
                          onSubmitted: (value) {
                            if (value.trim().isNotEmpty) {
                              bloc.changeCity(value);
                              bloc.searchController.clear();
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                                onTap: () {
                                  if (bloc.searchController.text
                                      .trim()
                                      .isNotEmpty) {
                                    bloc.changeCity(bloc.searchController.text);
                                    bloc.searchController.clear();
                                  }
                                },
                                child: const Icon(Icons.search,
                                    color: Colors.white)),
                            hintText: 'search...',
                            hintStyle: AppStyles.dropDownStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48.h,
                    left: 41.w,
                    child: ImageIcon(
                      const AssetImage(AppImages.location),
                      size: 27.sp,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 52.h,
                    left: 80.w,
                    child: Text(
                      bloc.initValue,
                      style: AppStyles.dropDownStyle,
                    ),
                  ),
                  Positioned(
                    top: 48.h,
                    left: 150.w,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColors.onPrimary,
                            content: SizedBox(
                              height: 500.h,
                              width: 200.w,
                              child: ListView.builder(
                                  itemCount: bloc.famousCapitals.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        bloc.changeCity(
                                            bloc.famousCapitals[index]);
                                        Navigator.pop(context);
                                      },
                                      child: ListTile(
                                        title: Text(bloc.famousCapitals[index]),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        );
                      },
                      child: Image.asset(
                        AppImages.dropArrow,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 79.h,
                    left: 70.w,
                    right: 70.w,
                    bottom: 592.h,
                    child: SizedBox(
                      height: 187.h,
                      width: 284.w,
                      child: Image.asset(
                        bloc.isday ? AppImages.sunface : AppImages.moonCloude,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 268.h,
                    left: 153.w,
                    bottom: 514.h,
                    child: Text(
                      "${bloc.temp.floor()}°",
                      textAlign: TextAlign.center,
                      style: AppStyles.tempStyle,
                    ),
                  ),
                  Positioned(
                    top: 349.h,
                    left: 120.w,
                    bottom: 467.h,
                    child: Text(
                      'Precipitations\nMax.: ${bloc.temp.floor() + 2}°   Min.: ${bloc.temp.floor() - 2}°',
                      textAlign: TextAlign.center,
                      style: AppStyles.precipitationsStyle,
                    ),
                  ),
                  infoContainer(bloc),
                  todayContainer(bloc),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
