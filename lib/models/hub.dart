import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/models/geo_location.dart';

class Hub {
  int id;
  String name;
  List<User> users = [];
  List<String> events = [];
  GeoLocation geoLocation;
  String iconUrl;

  Hub();

  Hub withUsers(List<User> users) {
    this.users = users;
    return this;
  }

  Hub withName(String name) {
    this.name = name;
    return this;
  }

  Hub withGeoLocation(GeoLocation geoLocation) {
    this.geoLocation = geoLocation;
    return this;
  }
}