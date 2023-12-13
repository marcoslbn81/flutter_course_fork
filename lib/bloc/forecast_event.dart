part of 'forecast_bloc.dart';

sealed class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class GetForecastEvent extends ForecastEvent {
  final num lat;
  final num lon;

  GetForecastEvent({required this.lat, required this.lon});
}
