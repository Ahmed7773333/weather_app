import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splach_state.dart';

class SplachCubit extends Cubit<SplachState> {
  SplachCubit() : super(SplachInitial());
}
