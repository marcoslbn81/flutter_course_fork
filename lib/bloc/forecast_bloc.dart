import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_course/models/forecast_model.dart';
import 'package:flutter_course/repositories/weather_repository.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final weatherRepository = WeatherRepository(); //tylko jeden bloc
  ForecastBloc() : super(ForecastLoading()) {
    on<GetForecastEvent>((event, emit) async {
      emit(ForecastLoading());
      final res =
          await weatherRepository.getForecastWeather(event.lat, event.lon);
      await Future.delayed(const Duration(seconds: 2));
      res.fold(
        (l) => emit(ForecastError(message: l.message)),
        (r) => emit(ForecastLoaded(forecastModel: r)),
      );
    });
  }
}
