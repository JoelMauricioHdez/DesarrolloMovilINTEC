import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheatherapp/location.dart';
import 'package:wheatherapp/results_page.dart';
import 'package:wheatherapp/wheather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    Location location = Location();
    await location.getCurrentPosition();

    Wheather? currentWheather = await Wheather.getWheather(
        lat: location.latitude, lon: location.longitud);

    if (currentWheather == null) {
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WheatherResultsPage(
            wheather: currentWheather,
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
