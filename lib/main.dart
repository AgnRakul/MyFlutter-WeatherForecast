import 'package:flutter/material.dart';

import 'package:weather/weather_forecast/model/weather_forecastModel.dart';
import 'package:weather/weather_forecast/network/Network.dart';
import 'package:weather/weather_forecast/ui/mid_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherForecast(),
  ));
}

class WeatherForecast extends StatefulWidget {
  WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;

  String _cityName = "Mumbai";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFieldView(),
          ),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapShot) {
                  if (snapShot.hasData) {
                    return Column(
                      children: [
                        midView(snapShot),
                      ],
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(cityName: _cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
} 


// https://api.openweathermap.org/data/2.5/weather?q={Cityname}&appid={API ID}