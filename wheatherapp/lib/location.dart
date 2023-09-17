import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.latitude, this.longitud});

  double? latitude;
  double? longitud;

  Future<void> getCurrentPosition() async {
    try {
      // ignore: unused_local_variable
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitud = position.longitude;
    } catch (error) {
      print(error);
    }
  }
}
