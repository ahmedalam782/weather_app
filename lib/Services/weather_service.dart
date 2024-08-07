import 'package:weather_app/Services/server_exceptions.dart';

import '../models/weather_model.dart';
import 'api_consumer.dart';

class WeatherService {
  final APIConsumer api;

  WeatherService({required this.api});

  final String baseURL = 'http://api.weatherapi.com/v1';
  final String apiKey = '53f2a545d5cd4972afa33857240605';

  Future getCurrentWeather({required String cityName}) async {
    try {
      var response = await api.getData(
        "$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on ServerExceptions catch (error) {
      return error.errorServerModel.errorMessage;
    }
  }
}
