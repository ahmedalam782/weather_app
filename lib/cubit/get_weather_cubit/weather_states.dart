import 'package:weather_app/models/weather_model.dart';

abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel? weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}

class ChangeAppThemeState extends WeatherStates {}
