import 'package:flutter_hackathon/models/geo_location.dart';
import 'package:flutter_hackathon/models/hub.dart';
import 'package:flutter_hackathon/repositories/mocks.dart';


class HubRepository {

  List<Hub> getAll() {
    return hubsMock;
  }

  Hub getById(int id) {
    return hubsMock.firstWhere((hub) => hub.id == id);
  }

  Hub getByName(String name) {
    return hubsMock.firstWhere((hub) => hub.name == name);
  }

  Hub getByGeoLocation(GeoLocation geoLocation) {
    return hubsMock.firstWhere((hub) {
      if (hub.geoLocation == null) return false;

     return hub.geoLocation.lat == geoLocation.lat &&  hub.geoLocation.long == geoLocation.long;
    });
  }
}