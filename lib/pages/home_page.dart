import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/components/initial_body.dart';
import 'package:weather_app_flutter/components/success_body.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/providers/weather_provider.dart';

import 'search_page.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // weatherData = Provider.of<WeatherProvider>(context).weatherData;
    
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            icon: const Icon(
              Icons.search,
              size: 34,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherStateSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherData;
            return SuccessBody(weatherData: state.weatherModel);
          } else if (state is WeatherStateFailure) {
            return const Center(
              child: Text(
                'Avoid negative words',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const InitialBody();
          }
        },
      ),
      // body: weatherData == null ?
      // const
      //     :
    );
  }
}
