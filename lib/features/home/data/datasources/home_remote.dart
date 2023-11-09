import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/api/end_points.dart';
import '../../../../core/api/responce_model.dart';
import '../../../../core/utils/constants.dart';
import '../repositories/home_repo.dart';

class HomeRemote extends HomeRepo {
  @override
  Future<WeatherData> getSource(String q) async {
    Uri url = Uri.https(
      Constants.basURl,
      EndPoints.endPoint,
      {"key": Constants.apiKey, "q": q, "api": "yes"},
    );
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    WeatherData data = WeatherData.fromJson(jsonData);
    return data;
  }
}
