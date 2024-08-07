import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';

import 'custom_container.dart';
import 'hour_design_widget.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.Hm().format(weatherModel.forecast.date);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(weatherModel.location.name,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(
          height: 10,
        ),
        Text(
            textAlign: TextAlign.center,
            "${weatherModel.location.region} (${weatherModel.location.country})",
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Updated at : $format',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.grey,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https:${weatherModel.forecast.conditionIcon!}",
            ),
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Text(
                        '°c',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontSize: 18,
                                ),
                      ),
                    ),
                    Text(
                      "${weatherModel.forecast.avgTemp.round()}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Text(
                  weatherModel.forecast.conditionText,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 20,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomContainer(
          title: 'Max Temperature',
          degree: "${weatherModel.forecast.maxTemp.round()}",
        ),
        CustomContainer(
          title: 'Min Temperature',
          degree: "${weatherModel.forecast.minTemp.round()}",
        ),
        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => HourDesignWidget(
            hours: weatherModel.hours[index],
          ),
          itemCount: weatherModel.hours.length,
        ))
      ],
    );
  }
}
