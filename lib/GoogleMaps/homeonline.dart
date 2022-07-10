// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';

class Path_Navigate extends StatefulWidget {
  static String id = 'path_screen';
  final LatLng currentlocation;
  final LatLng destinationlocation;
  const Path_Navigate(
      {Key? key,
      required this.currentlocation,
      required this.destinationlocation})
      : super(key: key);

  @override
  _Path_NavigateState createState() => _Path_NavigateState();
}

class _Path_NavigateState extends State<Path_Navigate> {
  late GoogleMapController _Pathmapcontroller;
  List<Marker> pathMarkers = [];
  MapsRoutes route = MapsRoutes();
  DistanceCalculator distanceCalculator = DistanceCalculator();
  String googleApiKey = 'AIzaSyASODipwXRfzJNuFRN8lCaQeMnxLXSOvgQ';
  String totalDistance = 'No route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: widget.currentlocation, zoom: 15),
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        markers: Set.from(pathMarkers),
        polylines: route.routes,
        onMapCreated: (controller) async {
          List<LatLng> points = [
            LatLng(19.0508, 73.0684),
            LatLng(19.045774, 73.081144),
            LatLng(19.032499, 73.066484),
          ];
          await route.drawRoute(
              points, 'Test routes', Color(0Xff4C6EE5), googleApiKey,
              travelMode: TravelModes.driving);
          setState(
            () {
              _Pathmapcontroller = controller;
              addCurrentLocation();
              adddestination();
              addPickupLocation();
            },
          );
        },
      ),
    );
  }

  void addCurrentLocation() {
    setState(
      () {
        pathMarkers.add(
          Marker(
            markerId: MarkerId('myLocation'),
            position: widget.currentlocation,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
          ),
        );
      },
    );

    CameraPosition cameraposition =
        CameraPosition(target: widget.currentlocation, zoom: 11);
    _Pathmapcontroller.animateCamera(
      CameraUpdate.newCameraPosition(cameraposition),
    );
  }

  void addPickupLocation() {
    setState(
      () {
        pathMarkers.add(
          Marker(
            markerId: MarkerId('PickupLocation'),
            position: LatLng(19.045774, 73.081144),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ),
        );
      },
    );
  }

  void adddestination() {
    setState(
      () {
        pathMarkers.add(
          Marker(
            markerId: MarkerId('destinationlocation'),
            position: widget.destinationlocation,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
          ),
        );
      },
    );
  }
}
