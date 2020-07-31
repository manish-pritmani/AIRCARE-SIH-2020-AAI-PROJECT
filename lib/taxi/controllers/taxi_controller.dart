import 'package:sih/taxi/models/taxi.dart';
import 'package:sih/taxi/models/taxi_type.dart';

class TaxiController {
  static Future<List<Taxi>> getTaxis() async {
    return [
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.Standard,
          id: "1",
          title: "Standard"),
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.Premium,
          id: "2",
          title: "Premium"),
      Taxi.named(
          plateNo: "",
          isAvailable: true,
          taxiType: TaxiType.Platinum,
          id: "3",
          title: "Standard"),
    ];
  }
}
