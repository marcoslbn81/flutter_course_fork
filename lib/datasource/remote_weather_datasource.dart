import 'package:dio/dio.dart';
import 'package:flutter_course/constants/api_k.dart';
import 'package:flutter_course/core/error/exceptions.dart';
import 'package:flutter_course/models/forecast_model.dart';
import 'package:flutter_course/models/weather_model.dart';

class ReamoteWeatherDatasource {
  final Dio dio = Dio();

  Future<WeatherModel> getWeatherByName(List<String> names) async {
    try {
      final response = await dio.get(ApiK.currentWeatherByName(names));
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw AuthServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ConnectionException();
    }
  }

  Future<ForecastModel> getForecastWeather(num lat, num lon) async {
    try {
      final response = await dio.get(ApiK.forecastWeather(lat, lon));
      return ForecastModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print(e.response);
        throw AuthServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ConnectionException();
    }
  }
}
