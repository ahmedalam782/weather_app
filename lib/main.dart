import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Shared/app_theme/app_theme.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_cubit.dart';
import 'package:weather_app/screens/home.dart';

import 'Shared/Bloc Observer/bloc_observer.dart';
import 'cubit/get_weather_cubit/weather_states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = const SimpleBlocObserver();

  runApp(BlocProvider(
    create: (_) => WeatherCubit(),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
      WeatherCubit weatherCubit = WeatherCubit.get(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: weatherCubit.isDark ? ThemeMode.dark : ThemeMode.light,
      );
    });
  }
}
