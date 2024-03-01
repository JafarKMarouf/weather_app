import 'package:weather_app_flutter/models/weather_model.dart';

abstract class WeatherState {}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherStateSuccess({required this.weatherModel});
}

class WeatherStateFailure extends WeatherState {}
