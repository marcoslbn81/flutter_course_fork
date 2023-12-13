// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course/pages/widgets/hourly_weather_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_course/bloc/forecast_bloc.dart';
import 'package:flutter_course/pages/widgets/hourly_weather_widget.dart';
import 'package:flutter_course/pages/widgets/main_weather_widget.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({
    Key? key,
    required this.locationName,
  }) : super(key: key);
  final String locationName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(locationName),
        centerTitle: true,
      ),
      body: BlocBuilder<ForecastBloc, ForecastState>(
        builder: (context, state) {
          if (state is ForecastLoaded) {
            return _LoadedForecastWeather(
              state: state,
            );
          } else if (state is ForecastError) {
            return Text(state.message);
          } else {
            return Center(
              child: SpinKitDancingSquare(color: Colors.red),
            );
          }
        },
      ),
    );
  }
}

class _LoadedForecastWeather extends StatelessWidget {
  const _LoadedForecastWeather({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ForecastLoaded state;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 10),
      //zmienić kolumnę na SingleChildScrollView
      child: Column(children: [
        MainWeatherWidget(),
        const Divider(),
        HourlyWeatherList(state: state),
        const Divider(),
      ]),
    );
  }
}
