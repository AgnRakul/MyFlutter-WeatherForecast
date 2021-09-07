import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/weather_forecast/model/weather_forecastModel.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast(
      {required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q=" +
        cityName +
        "&appid=" +
        Util.appId +
        "";

    final response = await get(Uri.parse(finalUrl));

    print("URL: ${Uri.parse(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(
          json.decode(response.body)); // mapped model
    } else {
      throw Exception("Erro Getting weather Forecast");
    }
  }
}
