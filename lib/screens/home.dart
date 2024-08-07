import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_states.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../widgets/no_weather_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherCubit weatherCubit = WeatherCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Weather App",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchScreen()),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              weatherCubit.changeAppTheme();
            },
            icon: const Icon(
              Icons.swap_horiz_outlined,
            ),
          )
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
        return weatherCubit.weatherModel == null
            ? const NoWeatherBody()
            : WeatherInfoBody(
                weatherModel: weatherCubit.weatherModel!,
              );
      }),
    );
  }
}
