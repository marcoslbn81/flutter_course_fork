class ApiK {
  static const String baseUrl = "https://api.openweathermap.org";
  static const String apiVer = "/data/2.5";
  static const String apiKey = "33b569087ebbb769bd35bba244ddbd7e";

  static String currentWeatherByName(List<String> names) {
    return "$baseUrl$apiVer/weather?units=metric&language=PL&appid=$apiKey&q=${names.join(",").toString()}";
  }

  static String weatherIcon(String iconCode) =>
      "http://openweathermap.org/img/wn/$iconCode@2x.png";

  static String forecastWeather(num lat, num lon) =>
      "$baseUrl$apiVer/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&units=metric&appid=$apiKey";
}
