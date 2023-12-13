import 'dart:convert';

import 'package:flutter_course/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
      cityName: "Lublin",
      main: "Clouds",
      description: "zachmurzenie duże",
      iconCode: "04d",
      temperature: -7.86,
      pressure: 1014,
      humidity: 96,
      lon: 22.5701,
      lat: 51.2506,
      weatherId: 804);

  var testJsonMap = json.decode(
      '{"coord":{"lon":22.5701,"lat":51.2506},"weather":[{"id":804,"main":"Clouds","description":"zachmurzenie duże","icon":"04d"}],"base":"stations","main":{"temp":-7.86,"feels_like":-13.09,"temp_min":-8.88,"temp_max":-6.67,"pressure":1014,"humidity":96},"visibility":6000,"wind":{"speed":3.13,"deg":124,"gust":9.39},"clouds":{"all":100},"dt":1701759931,"sys":{"type":2,"id":2043034,"country":"PL","sunrise":1701757005,"sunset":1701786233},"timezone":3600,"id":765876,"name":"Lublin","cod":200}');

  test("sould not return empty string", () {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helpers/dummy_data/dummy_weather_model.json"));
    expect(jsonMap, testJsonMap);
  });
  test('should return valid model from json', () {
    //AAA
    //arange - przygotowanie danych do testu
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helpers/dummy_data/dummy_weather_model.json"));
    //act - wykonanie akcji, która wpłynie na rezultat testu
    final result = WeatherModel.fromJson(jsonMap);
    //assert - sprawdzenie, czy dane, które były stworzone w act są zgodne z tymi, do których będziemy sie porównywać
    expect(result, equals(testWeatherModel));
  });
}
