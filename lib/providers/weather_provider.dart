import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherModel? _weatherData;
  String? cityName;
  bool isLoad = false;
  set weatherData (WeatherModel? weather)
  {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;

}