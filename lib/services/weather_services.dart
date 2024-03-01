import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a3a269848b5944ef92d62238232303';

    Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
      Uri url =
      Uri.parse(
          '$baseUrl/forecast.json?'
          'key=$apiKey&'
          'q=$cityName'
          '&days=1'
      );
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

     weather =  WeatherModel.fromJson(data);
    return weather;

  }
}
