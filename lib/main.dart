import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_flutter/providers/weather_provider.dart';
import 'package:weather_app_flutter/services/weather_services.dart';
import 'models/weather_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherServices()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // print(BlocProvider.of<WeatherCubit>(context).weatherData);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor:
              BlocProvider.of<WeatherCubit>(context).weatherData == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherData!
                      .getThemeData(),
          elevation: 0.0,
          // primaryColor: Colors.blue,
        ),
      ),
      home: HomePage(),
      // routes: {
      //   'home' : (context)=>HomePage(),
      // },
    );
  }
}
