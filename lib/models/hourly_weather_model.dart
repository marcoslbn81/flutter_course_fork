// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class HourlyWeatherModel extends Equatable {
  final String iconCode;
  final int pressure;
  final int humidity;
  final num temperature;
  final DateTime date;
  final int weatherId;

  const HourlyWeatherModel({
    required this.iconCode,
    required this.pressure,
    required this.humidity,
    required this.temperature,
    required this.date,
    required this.weatherId,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherModel(
      iconCode: json["weather"][0]["icon"],
      temperature: json["temp"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      date: DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
      weatherId: json["weather"][0]["id"],
    );
  }

  @override
  List<Object> get props {
    return [
      iconCode,
      pressure,
      humidity,
      temperature,
      date,
      weatherId,
    ];
  }
}
