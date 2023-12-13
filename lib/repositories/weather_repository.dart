import 'package:dartz/dartz.dart';
import 'package:flutter_course/core/error/exceptions.dart';
import 'package:flutter_course/core/error/failures.dart';
import 'package:flutter_course/datasource/remote_weather_datasource.dart';
import 'package:flutter_course/models/forecast_model.dart';
import 'package:flutter_course/models/weather_model.dart';

class WeatherRepository {
  final ReamoteWeatherDatasource remoteWeatherDatasource =
      ReamoteWeatherDatasource();

  Future<Either<Failure, WeatherModel>> getCurrentWeatherByName(
      List<String> name) async {
    try {
      final res = await remoteWeatherDatasource.getWeatherByName(name);
      return Right(res);
    } on AuthServerException {
      return Left(
        ServerFailure(message: "Błędny access token."),
      );
    } on ServerException {
      return Left(
        ServerFailure(
            message: "Nie znaleziono takiego miejsca. SPróbuj jeszcze raz."),
      );
    } on ConnectionException {
      return Left(
        ConnectionFailure(message: "Upewnij się, że masz dostęp do Internetu."),
      );
    }
  }

  Future<Either<Failure, ForecastModel>> getForecastWeather(
      num lat, num lon) async {
    try {
      final res = await remoteWeatherDatasource.getForecastWeather(lat, lon);
      return Right(res);
    } on AuthServerException {
      return Left(
        ServerFailure(message: "Błędny access token."),
      );
    } on ServerException {
      return Left(
        ServerFailure(
            message: "Nie znaleziono takiego miejsca. SPróbuj jeszcze raz."),
      );
    } on ConnectionException {
      return Left(
        ConnectionFailure(message: "Upewnij się, że masz dostęp do Internetu."),
      );
    }
  }
}
