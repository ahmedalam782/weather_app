import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../Services/dio_consumer.dart';
import '../../Services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  WeatherModel? weatherModel;
  bool isDark = false;

  getWeather({required String cityName}) async {
    weatherModel = null;
    try {
      weatherModel = await WeatherService(api: DioConsumer(dio: Dio()))
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel));
    } catch (error) {
      emit(WeatherFailureState());
    }
  }

  changeAppTheme() {
    isDark = !isDark;
    emit(ChangeAppThemeState());
  }
}
