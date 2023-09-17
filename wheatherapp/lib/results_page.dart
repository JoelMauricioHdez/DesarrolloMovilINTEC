import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wheatherapp/design_system.dart';
import 'package:wheatherapp/loading_screen.dart';
import 'package:wheatherapp/weather_search.dart';
import 'package:wheatherapp/wheather.dart';

class WeatherResultsPage extends StatefulWidget {
  const WeatherResultsPage({Key? key, required this.weatherData})
      : super(key: key);

  final Map<String, dynamic> weatherData;

  @override
  State<WeatherResultsPage> createState() => _WeatherResultsPageState();
}

class _WeatherResultsPageState extends State<WeatherResultsPage> {
  String? temperature;
  String? climate;
  String? location;

  @override
  void initState() {
    temperature = widget.weatherData["main"]["temp"].toString();
    location = widget.weatherData["name"];
    climate = WeatherIcon.values
        .byName(
            widget.weatherData["weather"][0]["main"].toString().toLowerCase())
        .icon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoadingScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.near_me,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherSearch(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.location_city,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$temperature° $climate',
                  style: kMessageTextStyle.copyWith(fontSize: 80),
                ),
                Text(
                  "$location",
                  style: kMessageTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
