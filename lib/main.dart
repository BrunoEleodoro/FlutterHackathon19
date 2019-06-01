import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon/repositories/mocks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'pages/profile_page.dart';
import 'pages/hub_profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'Starling',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MapSample(),
        '/profile': (context) => ProfilePage(),
        '/profile_page': (context) => HubProfilePage(),
      },
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

  void loadData() async {
    BitmapDescriptor bitmapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(32, 32)), "assets/flutter.png");

    hubsMock.forEach((hub) {
      var markerId = MarkerId(hub.name+hub.id.toString());
      markers[markerId] = new Marker(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HubProfilePage(
                    hubId: hub.id,
                  )),
            );
          },
          markerId: markerId,
          icon: bitmapDescriptor,
          position: LatLng(hub.geoLocation.lat, hub.geoLocation.long),
          infoWindow: InfoWindow(title: hub.name));
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return new Scaffold(
      body: (markers.length > 0)
          ? Stack(
              children: <Widget>[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  myLocationButtonEnabled: false,
                  markers: Set<Marker>.of(markers.values),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, right: 16),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 32, left: 16, right: 80),
                      height: 60,
                      width: double.maxFinite,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextField(
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(hintText: 'Hub name'),
                          ),
                        ),
                      ),
                    ))
              ],
            )
          : Center(child: CircularProgressIndicator()),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          Navigator.of(context).pushNamed('/profile');
//        },
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
