import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_flutter/models/weather_model.dart';
import 'package:weather_app_flutter/providers/weather_provider.dart';
import 'package:weather_app_flutter/services/weather_services.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Search a City',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Form(
          key: formKey,
          child: Stack(
            children:[
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'This field must not be empty ';
                  }
                },
                onChanged: (val) {
                  cityName = val;
                },
                onFieldSubmitted: (val) async {
                  if(formKey.currentState!.validate())
                    {
                      cityName = val;
                      BlocProvider.of<WeatherCubit>(context)
                          .getWeather(cityName: cityName!);
                      // print('inside submitted');
                      // isLoad = true;
                      // setState((){});
                      // cityName = val;
                      // WeatherServices weatherServices = WeatherServices();
                      // WeatherModel? weather =
                      // await weatherServices.getWeather(cityName: cityName!);
                      // Provider.of<WeatherProvider>(context, listen: false).weatherData =
                      //     weather;
                      // Provider.of<WeatherProvider>(context, listen: false).cityName =
                      //     cityName;
                      // // Provider.of<WeatherProvider>(context).isLoad = false;
                      // isLoad = false;
                      // setState((){});
                      Navigator.pop(context);
                    }
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  contentPadding:const
                  EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 25),
                  label: const Text(
                    'search',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  hintText: 'Enter your city to search ..',
                  suffixIcon: IconButton(
                      onPressed: () async {
                        print('inside iconbutton');
                        // Provider.of<WeatherProvider>(context).isLoad = true;
                        if (formKey.currentState!.validate()) {
                          // isLoad = true;
                          // setState((){});
                          // WeatherServices weatherServices = WeatherServices();
                          // WeatherModel? weather =
                          // await weatherServices.getWeather(cityName: cityName!);
                          // Provider.of<WeatherProvider>(context, listen: false)
                          //     .weatherData = weather;
                          // Provider.of<WeatherProvider>(context, listen: false)
                          //     .cityName = cityName;
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeather(cityName: cityName!);
                          Navigator.pop(context);
                        }
                        // isLoad = false;
                        // setState((){});
                        // Provider.of<WeatherProvider>(context).isLoad = false;
                      },
                      icon: const Icon(Icons.search_outlined)),
                ),
              ),
              // isLoad? const Center(child:CircularProgressIndicator(),):Container(),
            ],
          ),
        ),
      ),
    );
  }
}
// WeatherModel ?weatherData;
