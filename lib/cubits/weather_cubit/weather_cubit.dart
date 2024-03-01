import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherServices weatherServices;

  WeatherCubit(this.weatherServices) : super(WeatherStateInitial());
  WeatherModel? weatherData;
  String? city;
  void getWeather({required String cityName}) async {
    emit(WeatherStateLoading());
    try {
      city = cityName;
      // print('==============city:${city}============');
      weatherData = await weatherServices.getWeather(cityName: cityName);
      // print('===============$weatherData===============');
      emit(WeatherStateSuccess(weatherModel: weatherData!));
    } catch (e) {
      emit(WeatherStateFailure());
    }
  }
}
