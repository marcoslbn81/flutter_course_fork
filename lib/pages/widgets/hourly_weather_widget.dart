// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_course/constants/constants.dart';

import 'package:flutter_course/models/hourly_weather_model.dart';
import 'package:intl/intl.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({
    Key? key,
    required this.hourWeather,
  }) : super(key: key);
  final HourlyWeatherModel hourWeather;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade200,
      child: Column(
        children: [
          Image.asset(
            getImage(hourWeather.weatherId),
            fit: BoxFit.scaleDown,
            width: 75,
          ),
          Text(DateFormat("H:mm").format(hourWeather.date)),
          Text("${hourWeather.temperature.toStringAsFixed(1)}°C")
        ],
      ),
    );
  }
}
