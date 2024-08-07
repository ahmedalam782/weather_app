class WeatherModel {
  final Location location;
  final Forecast forecast;
  final List<dynamic> hours;

  const WeatherModel(
      {required this.hours, required this.forecast, required this.location});

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
      forecast: Forecast(
        maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
        conditionText: jsonData['forecast']['forecastday'][0]['day']
            ['condition']['text'],
        conditionIcon: jsonData['forecast']['forecastday'][0]['day']
            ['condition']['icon'],
        avgTemp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
        date: DateTime.parse(jsonData['current']['last_updated']),
      ),
      location: Location(
        name: jsonData['location']['name'],
        country: jsonData['location']['country'],
        region: jsonData['location']['region'],
      ),
      hours: jsonData['forecast']['forecastday'][0]['hour'],
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;

  const Location({
    required this.name,
    required this.country,
    required this.region,
  });
}

class Forecast {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String conditionText;
  final String? conditionIcon;

  const Forecast({
    required this.maxTemp,
    required this.minTemp,
    required this.conditionText,
    required this.conditionIcon,
    required this.avgTemp,
    required this.date,
  });
}
