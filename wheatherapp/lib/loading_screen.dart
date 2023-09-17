import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheatherapp/location.dart';
import 'package:wheatherapp/results_page.dart';
import 'package:wheatherapp/utils.dart';
import 'package:wheatherapp/wheather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getData() async {
    Location location = Location();
    await location.getCurrentPosition();

    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitud}&appid=eee63e77c4f6ef2fd264a11be66adc1a&units=metric';

    var currentWheather = await Weather.getWeather(url);

    if (currentWheather == null) {
      // ignore: use_build_context_synchronously
      showErrorMessage(
          context: context,
          title: "Error",
          description: "There has been an error while checking the weather");
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherResultsPage(
            weatherData: currentWheather,
          );
        },
      ),
      (condition) {
        return false;
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
