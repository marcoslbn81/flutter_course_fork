// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_course/bloc/forecast_bloc.dart';
import 'package:flutter_course/pages/widgets/hourly_weather_widget.dart';

class HourlyWeatherList extends StatelessWidget {
  const HourlyWeatherList({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ForecastLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.forecastModel.hourlyForecast.length,
        itemBuilder: (context, index) => HourlyWeatherWidget(
          hourWeather: state.forecastModel.hourlyForecast[index],
        ),
      ),
    );
  }
}
