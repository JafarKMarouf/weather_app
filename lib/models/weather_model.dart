import 'package:flutter/material.dart';

class WeatherModel {
  String imageName;
  double avgTemp;
  DateTime date;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel({
    required this.imageName,
    required this.avgTemp,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(dynamic json) {
    var jsonData = json['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(json['location']['localtime']),
        avgTemp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        imageName: jsonData['condition']['icon'],
    );

  }
  @override
  String toString() {
    return "temp = $avgTemp, date:$date";
    // return super.toString();
  }
  // String imageName(){
  //   if(weatherStateName == '')
  //     return 'assets/images/thunderstorm.png';
  //   return "";
  // }

  Color getThemeData(){
    if(weatherStateName == 'Snow' || weatherStateName == 'Light snow')
      {
        return Colors.blue;
      }
    else if(weatherStateName == 'Sunny' || weatherStateName == 'Clear')
      {
        return Colors.orange;
      }
    else if(weatherStateName == 'Rain' || weatherStateName == 'Hail' ||weatherStateName == 'Patchy rain nearby' )
      {
        return Colors.grey;
      }
    else if(weatherStateName == 'Thunder and Lightning' || weatherStateName == 'Humidity')
      {
        return Colors.red;
      }
    else {
      return Colors.yellow;
    }
    // else  Colors.white;
  }





}
