import 'package:flutter/foundation.dart';
import 'package:flutter_course/models/daily_weather_model.dart';
import 'package:flutter_course/models/hourly_weather_model.dart';

class ForecastModel {
  final num currentTemp;
  final int id;
  final String name;
  final String icon;
  final List<DailyWeatherModel> dailyForecast;
  final List<HourlyWeatherModel> hourlyForecast;

  ForecastModel(
      {required this.currentTemp,
      required this.id,
      required this.name,
      required this.icon,
      required this.dailyForecast,
      required this.hourlyForecast});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        currentTemp: json["current"]["temp"],
        id: json["current"]["weather"][0]["id"],
        name: json["current"]["weather"][0]["main"],
        icon: json["current"]["weather"][0]["icon"],
        dailyForecast: List<DailyWeatherModel>.from(
          json["daily"].map(
            (day) => DailyWeatherModel.fromJson(day),
          ),
        ),
        hourlyForecast: List<HourlyWeatherModel>.from(
          json["hourly"].map(
            (hour) => HourlyWeatherModel.fromJson(hour),
          ),
        ),
      );
}
