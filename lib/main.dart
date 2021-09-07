import 'package:flutter/material.dart';
import 'package:weather/weather_forecast/model/weather_forecastModel.dart';
import 'package:weather/weather_forecast/network/Network.dart';

void main() {
  runApp(MaterialApp(home: WeatherForecast()));
}

class WeatherForecast extends StatefulWidget {
  WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Madurai";

  @override
  void initState() {
    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);

    forecastObject.then((weather) => {print(weather.sys.sunrise)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forecast"),
      ),
    );
  }
}







// https://api.openweathermap.org/data/2.5/weather?q=Madurai&appid=108db658347c820baa5bd7f6a0623bef