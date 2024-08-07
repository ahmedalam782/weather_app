import 'package:flutter/material.dart';
import 'package:weather_app/Shared/app_theme/app_theme.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    WeatherCubit weatherCubit = WeatherCubit.get(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Search city",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Form(
            key: formKey,
            child: TextFormField(
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 20,
                  ),
              controller: TextEditingController(),
              onFieldSubmitted: (value) async {
                if (formKey.currentState!.validate()) {
                  WeatherCubit weatherCubit = WeatherCubit.get(context);
                  weatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                }
              },
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'city name must not be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                labelText: 'Search',
                labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 20,
                    ),
                hintText: 'Enter City Name',
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 18,
                    ),
                suffixIcon: Icon(
                  Icons.search,
                  color: weatherCubit.isDark ? AppTheme.white : AppTheme.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
