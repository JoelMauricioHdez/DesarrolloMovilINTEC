import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as requests;

enum WeatherIcon {
  clouds("☁️"),
  clear("☀️"),
  thunderstorm("⛈️"),
  drizzle("☔️"),
  rain("🌧️"),
  mist("🌫️");

  final String icon;
  const WeatherIcon(this.icon);
}

class Weather {
  static Future<Map<String, dynamic>?> getWeather(String url) async {
    try {
      var response = await requests.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return jsonResponse;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
