import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wheatherapp/results_page.dart';
import 'package:wheatherapp/utils.dart';
import 'package:wheatherapp/wheather.dart';
import 'package:wheatherapp/design_system.dart';

class WeatherSearch extends StatefulWidget {
  @override
  State<WeatherSearch> createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  final TextEditingController _controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/location_background.jpg'),
          fit: BoxFit.cover,
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 60),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _controller,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        labelStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        contentPadding: const EdgeInsets.all(20),
                        labelText: 'Insert city',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 3,
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        var data = await Weather.getWeather(
                            'https://api.openweathermap.org/data/2.5/weather?q=${_controller.text}&appid=32418f43c7450a93fda59a9d82b8aea5&units=metric');

                        if (data == null) {
                          // ignore: use_build_context_synchronously
                          showErrorMessage(
                            context: context,
                            title: "Invalid city name",
                            description:
                                'Please make sure you are inserting the name of an actual city',
                          );
                          return;
                        }

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WeatherResultsPage(weatherData: data),
                          ),
                        );
                      },
                      child: Text(
                        'Search weather',
                        style: kMessageTextStyle.copyWith(
                            fontSize: 25, color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
