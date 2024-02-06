import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/providers/weather_provider.dart';
// import 'pro';
import 'models/weather_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) {
      return WeatherProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Provider.of<WeatherProvider>(context).weatherData == null?
              Colors.white : Provider.of<WeatherProvider>(context).weatherData!.getThemeData() ,
        elevation: 0.0,
        ),
        // primaryColor: Colors.blue,
      ),
      home: HomePage(),
      // routes: {
      //   'home' : (context)=>HomePage(),
      // },
    );
  }
}
