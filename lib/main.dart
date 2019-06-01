import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-22.816987, -47.045458),
    zoom: 15.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BitmapDescriptor bitmapDescriptor = BitmapDescriptor.defaultMarker;
    var markerIdCampinas = MarkerId("campinas");
    var markerId = MarkerId("campinas");
    markers[markerId] = new Marker(
        markerId: markerId,
        icon: bitmapDescriptor,
        position: LatLng(-22.816987, -47.045458),
        infoWindow: InfoWindow(
            title: "Campinas Hub"
        ));
    markers[markerIdCampinas] = new Marker(
        markerId: markerId,
        icon: bitmapDescriptor,
        position: LatLng(-22.814802, -47.044685),
        infoWindow: InfoWindow(
            title: "Campinas Hub"
        ));


    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
