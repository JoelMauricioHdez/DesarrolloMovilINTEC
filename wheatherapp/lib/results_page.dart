import 'package:flutter/material.dart';
import 'package:wheatherapp/design_system.dart';
import 'package:wheatherapp/wheather.dart';

class WheatherResultsPage extends StatefulWidget {
  const WheatherResultsPage({Key? key, required this.wheather})
      : super(key: key);

  final Wheather wheather;

  @override
  State<WheatherResultsPage> createState() => _WheatherResultsPageState();
}

class _WheatherResultsPageState extends State<WheatherResultsPage> {
  String recomendation = '🍦';

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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_outward,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_city,
                      size: 40,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.wheather.temperature}° ${widget.wheather.wheather}',
                style: kMessageTextStyle.copyWith(fontSize: 80),
              ),
              Text(
                "It's $recomendation time in ${widget.wheather.country}",
                style: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
