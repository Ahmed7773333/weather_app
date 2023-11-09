import '../../../../core/api/responce_model.dart';

abstract class HomeRepo {
  Future<WeatherData> getSource(String q);
}
