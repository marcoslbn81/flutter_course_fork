part of 'forecast_bloc.dart';

sealed class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object> get props => [];
}

final class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final ForecastModel forecastModel;

  ForecastLoaded({required this.forecastModel});
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError({required this.message});
}
