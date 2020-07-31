import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih/taxi/models/user_location.dart';
import 'package:location/location.dart';

class UserLocationController {
  static Future<LatLng> getCurrentLocation() async {
    Location location = Location();
    PermissionStatus  check = await location.hasPermission();

    if (check == PermissionStatus.granted ) {
      LocationData position = await location.getLocation();
      return LatLng(position.latitude, position.longitude);
    }
    return null;
  }

  static Future<List<UserLocation>> getSavedLocations() async {
    return [
      UserLocation.named(
          name: "Airport",
          locationType: UserLocationType.Airport,
          position: LatLng(0, 0),
          minutesFar: 23),
      UserLocation.named(
          name: "Hotels",
          locationType: UserLocationType.Hotels,
          position: LatLng(0, 0),
          minutesFar: 15),
    ];
  }
}
