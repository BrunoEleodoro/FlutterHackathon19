import 'package:flutter_hackathon/models/geo_location.dart';
import 'package:flutter_hackathon/models/hub.dart';
import 'package:flutter_hackathon/models/user.dart';

var userMock = [
  User().withId(1).withName("Ana"),
  User().withId(2).withName("Bill"),
  User().withId(3).withName("Paul"),
];

var hubsMock = [
  Hub().withName("Hub Campinas")
      .withUsers(userMock)
      .withGeoLocation(GeoLocation(-22.816987, -47.045458)),
  Hub().withName("Hub Sampa")
      .withUsers(userMock)
      .withGeoLocation(GeoLocation(-22.816987, -47.045458)),
];
