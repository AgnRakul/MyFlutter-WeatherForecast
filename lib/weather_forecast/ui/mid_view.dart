import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather_forecast/model/weather_forecastModel.dart';
import 'package:weather/weather_forecast/util/convert_icon.dart';
import 'package:weather/weather_forecast/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var city = snapshot.data!.name;
  var country = snapshot.data!.sys.country;
  var formattedDate = snapshot.data!.dt * 1000;
  var sunrise = snapshot.data!.sys.sunrise * 1000;
  var sunset = snapshot.data!.sys.sunset * 1000;
  var tempature = int.parse(snapshot.data!.main.temp.toStringAsFixed(0));
  var newTemp = ((tempature - 273.15) * (9 / 5) + 32).round();
  var description = snapshot.data!.weather[0].description;
  var speed = snapshot.data!.wind.speed;
  var humidity = snapshot.data!.main.humidity;
  var maxTempature = int.parse(snapshot.data!.main.tempMax.toStringAsFixed(0));
  var newMaxTemp = ((maxTempature - 273.15) * (9 / 5) + 32).round();
  var weatherMain = snapshot.data!.weather[0].main;
  var visiblity = snapshot.data!.visibility / 1000;

  Container midView = Container(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$city, $country",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Colors.black87),
          ),
          Text(
            "${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(formattedDate))}",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: weatherMain,
                color: Colors.pinkAccent,
                size: 198),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$newTemp°F",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$description".toUpperCase(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$speed \nmi/h",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 30,
                        color: Colors.brown,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$humidity%",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.solidGrinBeamSweat,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$newMaxTemp\n°F",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FaIcon(
                        FontAwesomeIcons.temperatureHigh,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidSun,
                    color: Colors.yellow,
                  ),
                  Text(
                    "${Util.getFormattedTime(new DateTime.fromMillisecondsSinceEpoch(sunrise))}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  FaIcon(
                    FontAwesomeIcons.solidSun,
                    color: Colors.orange[200],
                  ),
                  Text(
                    "${Util.getFormattedTime(new DateTime.fromMillisecondsSinceEpoch(sunset))}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Visibility: $visiblity Km",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    ),
  );

  return midView;
}
