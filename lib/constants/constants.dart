class K {}

String getImage(int weatherId) {
  if (weatherId >= 200 && weatherId <= 232) {
    return "assets/png/wsymbol_0024_thunderstorms.png";
  } else if (weatherId >= 300 && weatherId <= 321) {
    return "assets/png/wsymbol_0017_cloudy_with_light_rain.png";
  } else if (weatherId >= 500 && weatherId <= 504) {
    return "assets/png/wsymbol_0010_heavy_rain_showers.png";
  } else if (weatherId == 511) {
    return "assets/png/wsymbol_0021_cloudy_with_sleet.png";
  } else if (weatherId >= 520 && weatherId <= 531) {
    return "assets/png/wsymbol_0018_cloudy_with_heavy_rain.png";
  } else if (weatherId >= 600 && weatherId <= 622) {
    return "assets/png/wsymbol_0020_cloudy_with_heavy_snow.png";
  } else if (weatherId >= 701 && weatherId < 781) {
    return "assets/png/wsymbol_0007_fog.png";
  } else if (weatherId == 800) {
    return "assets/png/wsymbol_0001_sunny.png";
  } else if (weatherId == 801) {
    return "assets/png/wsymbol_0002_sunny_intervals.png";
  } else {
    return "assets/png/wsymbol_0003_white_cloud.png";
  }
}
