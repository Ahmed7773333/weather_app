import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/observer.dart';
import 'package:weather_app/my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
