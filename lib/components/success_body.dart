import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_flutter/models/weather_model.dart';

class SuccessBody extends StatelessWidget {
  SuccessBody({super.key, required this.weatherData});
  WeatherModel weatherData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          // weatherData!.getThemeData()[100],
          weatherData!.getThemeData(),
          Colors.red,
          // Colors.yellow,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            '${BlocProvider.of<WeatherCubit>(context).city}',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated ${weatherData!.date.hour}:${weatherData!.date.minute}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'http:${weatherData!.imageName}',
              ),
              Text(
                '${weatherData!.avgTemp.toInt()} C',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherData!.maxTemp.toInt()} C',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'minTemp: ${weatherData!.minTemp.toInt()} C',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            weatherData!.weatherStateName.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
