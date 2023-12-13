import 'package:equatable/equatable.dart';

class DailyWeatherModel extends Equatable {
  final String iconCode;
  final int pressure;
  final int humidity;
  final num maxTemperature;
  final num minTemperature;
  final DateTime date;
  final int weatherId;

  const DailyWeatherModel({
    required this.iconCode,
    required this.pressure,
    required this.humidity,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
    required this.weatherId,
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    return DailyWeatherModel(
      iconCode: json["weather"][0]["icon"],
      maxTemperature: json["temp"]["max"],
      minTemperature: json["temp"]["min"],
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
      maxTemperature,
      minTemperature,
      date,
      weatherId,
    ];
  }
}
