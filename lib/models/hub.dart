import 'package:flutter_hackathon/models/user.dart';
import 'package:flutter_hackathon/models/geo_location.dart';

class Hub {
  int id;
  String name;
  String description;
  List<User> users = [];
  List<String> events = [];
  GeoLocation geoLocation;
  String photoUrl;

  Hub();

  Hub withId(int id) {
    this.id = id;
    return this;
  }

  Hub withUsers(List<User> users) {
    this.users = users;
    return this;
  }

  Hub withName(String name) {
    this.name = name;
    return this;
  }

  Hub withDescription(String description) {
    this.description = description;
    return this;
  }

  Hub withGeoLocation(GeoLocation geoLocation) {
    this.geoLocation = geoLocation;
    return this;
  }

  Hub withPhotoUrl(String url) {
    this.photoUrl = url;
    return this;
  }

  Hub withEvents(List<String> events) {
    this.events = events;
    return this;
  }
}