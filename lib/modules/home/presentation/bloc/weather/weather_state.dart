part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final CurrentWeatherDataEntity currentWeatherDataEntity;

  WeatherSuccess(this.currentWeatherDataEntity);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
