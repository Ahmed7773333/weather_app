import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/api/responce_model.dart';
import 'package:weather_app/features/home/data/repositories/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeInitial());
  HomeRepo repo;
  static HomeCubit get(context) => BlocProvider.of(context);
  List<String> famousCapitals = [
    "Paris",
    "London",
    "Rome",
    "Tokyo",
    "Beijing",
    "Moscow",
    "Washington, D.C.",
    "Berlin",
    "New Delhi",
    "Cairo",
    "Athens",
    "Buenos Aires",
    "Brasília",
    "Vienna",
    "Bangkok",
    "Seoul",
    "Amsterdam",
    "Ottawa",
    "Madrid",
    "Canberra",
    "Istanbul",
    "Vienna",
    "Nairobi",
    "Stockholm",
    "Prague",
    "Dublin",
    "Budapest",
    "Lisbon",
    "Warsaw",
    "Helsinki",
    "Oslo",
    "Copenhagen",
    "Jakarta",
    "Kuala Lumpur",
    "Manila",
    "Wellington",
    "Singapore",
    "Riyadh",
  ];

  String initValue = 'Cairo';
  TextEditingController searchController = TextEditingController();
  double temp = 0;
  int humidity = 0;
  int cloud = 0;
  String icon = '';
  double pressureMb = 0;
  double pressureIn = 0;
  double precipitationMm = 0;
  double precipitationIn = 0;
  double feelsLikeC = 0;
  double feelsLikeF = 0;
  double visibilityKm = 0;
  double visibilityMiles = 0;
  double uVIndex = 0;
  double gustMph = 0;
  double gustKph = 0;
  bool isday = true;
  double windSpeed = 0;

  void changeCity(String city) {
    emit(HomeLoading());

    initValue = city;
    emit(ChangeCityState());
  }

  Future<void> getWeatherData() async {
    try {
      WeatherData data = await repo.getSource(initValue);
      emit(HomeLoading());
      temp = data.current?.tempC ?? 0;
      humidity = data.current?.humidity ?? 0;
      windSpeed = data.current?.windKph ?? 0;
      cloud = data.current?.cloud ?? 0;
      icon = data.current?.condition?.icon ?? '';
      pressureMb = data.current?.pressureMb ?? 0;
      pressureIn = data.current?.pressureIn ?? 0;
      precipitationMm = data.current?.precipMm ?? 0;
      precipitationIn = data.current?.precipIn ?? 0;
      feelsLikeC = data.current?.feelslikeC ?? 0;
      feelsLikeF = data.current?.feelslikeF ?? 0;
      visibilityKm = data.current?.visKm ?? 0;
      visibilityMiles = data.current?.visMiles ?? 0;
      uVIndex = data.current?.uv ?? 0;
      gustMph = data.current?.gustMph ?? 0;
      gustKph = data.current?.gustKph ?? 0;
      isday = (data.current?.isDay ?? 0) == 0 ? false : true;

      emit(HomeSuccess());
    } catch (e) {
      emit(HomeError());
      debugPrint(e.toString());
    }
  }
}
