import 'dart:convert' as convert;
import 'package:http/http.dart' as requests;
import 'package:flutter/material.dart';

enum WheatherIcon {
  clouds('Clouds', "☁️"),
  clear('Clear', "☀️"),
  thunderstorm('Thunderstorm', "⛈️"),
  drizzle('Drizzle', "☔️"),
  rain('Rain', "🌧️"),
  mist('Mist', "🌫️");

  final String name;
  final String icon;
  const WheatherIcon(this.name, this.icon);
}

class Wheather {
  Wheather({this.country, this.wheather, this.temperature});

  String? wheather;
  String? country;
  String? temperature;

  static Future<Wheather?> getWheather({required lat, required lon}) async {
    try {
      var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=eee63e77c4f6ef2fd264a11be66adc1a&units=metric',
      );
      var response = await requests.get(url);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return Wheather(
          wheather: WheatherIcon.values
              .byName(
                  jsonResponse["weather"][0]["main"].toString().toLowerCase())
              .icon,
          country: jsonResponse["name"],
          temperature: jsonResponse["main"]["temp"].toString(),
        );
      } else {
        return null;
      }
    } catch (error) {
      AlertDialog.adaptive(
        title: const Text("Error"),
        content: Text(error.toString()),
      );
      return null;
    }
  }
}
