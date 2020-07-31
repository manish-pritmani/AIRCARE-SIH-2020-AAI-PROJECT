import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih/taxi/controllers/location_controller.dart';
import 'package:sih/taxi/models/google_location.dart';
import 'package:sih/taxi/models/taxi.dart';
import 'package:sih/taxi/models/taxi_booking.dart';
import 'package:sih/taxi/models/taxi_driver.dart';

class TaxiBookingController {
  static Future<double> getPrice(TaxiBooking taxiBooking) async {
    return 150;
  }

  static Future<TaxiDriver> getTaxiDriver(TaxiBooking booking) async {
    return TaxiDriver.named(
        driverPic:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkILyCzWBYk-2HD4L4ddnUb5FSXy84sTkvIw&usqp=CAU",
        driverName: "Mukesh Khatri",
        driverRating: 4.5,
        taxiDetails: "Toyota Innova \n(MP-20-CF-3234)");
  }

  static Future<List<Taxi>> getTaxisAvailable() async {
    GoogleLocation location = await LocationController.getCurrentLocation();
    const double maxRadius = 200 / 111300;
    Random random = Random();
    List<Taxi> taxis = List<Taxi>.generate(10, (index) {
      double u = random.nextDouble();
      double v = random.nextDouble();
      double w = maxRadius + sqrt(u);
      double t = 2 * pi * v;
      double x1 = w * cos(t);
      double y1 = w * sin(t);
      x1 = x1 / cos(y1);
      LatLng oldPos = location.position;
      return Taxi.named(
          id: "$index",
          position: LatLng(x1 + oldPos.latitude, y1 + oldPos.longitude),
          title: "Taxi $index");
    });
    return taxis;
  }
}
