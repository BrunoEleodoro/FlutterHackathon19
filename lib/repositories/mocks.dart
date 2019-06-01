import 'package:flutter_hackathon/models/geo_location.dart';
import 'package:flutter_hackathon/models/hub.dart';
import 'package:flutter_hackathon/models/user.dart';

var userMock = [
  User().withId(1).withName("Ana"),
  User().withId(2).withName("Bill"),
  User().withId(3).withName("Paul"),
];

var hubsMock = [
  Hub().withId(1)
  .withPhotoUrl("https://media.licdn.com/dms/image/C4D22AQG-e-wLPG8dnQ/feedshare-shrink_8192/0?e=1561593600&v=beta&t=0U1OnROHLYqeubGFRP1d6DrTl1Ae93L_fl3LkGrOjqE")
      .withName("Hub Campinas")
  .withDescription("Campinas hub flutter!")
      .withUsers(userMock)
      .withGeoLocation(GeoLocation(-22.816987, -47.045458)),
  Hub().withId(2)
      .withPhotoUrl("https://media.licdn.com/dms/image/C4D22AQG-e-wLPG8dnQ/feedshare-shrink_8192/0?e=1561593600&v=beta&t=0U1OnROHLYqeubGFRP1d6DrTl1Ae93L_fl3LkGrOjqE")
      .withName("Hub Sampa")
      .withDescription("Sampa hub flutter!")
      .withUsers(userMock)
      .withGeoLocation(GeoLocation(-22.816987, -47.045458)),
];
