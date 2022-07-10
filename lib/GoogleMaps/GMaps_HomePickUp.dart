// ignore_for_file: file_names, prefer_const_constructors, unused_field, unused_element, constant_identifier_names, unused_import, unnecessary_const, unnecessary_new, avoid_print, unused_local_variable, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:siren24/GoogleMaps/direction_response.dart' as res;

import 'directions.dart';
// import 'globalVariableGoogleMapsPickup.dart';

class GMapsHomePickUp extends StatefulWidget {
  const GMapsHomePickUp({
    Key? key,
  }) : super(key: key);

  @override
  _GMapsHomePickUpState createState() => _GMapsHomePickUpState();
}

class _GMapsHomePickUpState extends State<GMapsHomePickUp> {
  late GoogleMapController _controller;
  static const LatLng _center = LatLng(25.540539431310854, 84.85082954594253);

  late BitmapDescriptor sourceIcon;
  // late BitmapDescriptor destinationIcon;

  String googleAPIKey = 'AIzaSyASODipwXRfzJNuFRN8lCaQeMnxLXSOvgQ';

  Position? _position;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId('Driver'),
            position: LatLng(25.540539431310854, 84.85082954594253),
            icon: sourceIcon,
            infoWindow: InfoWindow(
              title: 'Building Name',
              snippet: 'Locality Name, Area, Pincode',
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _onAddMarkerButtonPressed();
    getLocation();

    Geolocator.getPositionStream().listen(
      (p) {
        setState(() {
          _position = p;
        });
      },
    );

    setCustomMarker();
  }

  late LatLng latLng = LatLng(25.540539431310854, 84.85082954594253);
  late LocationData currentLocation;
  getLocation() async {
    var location = new Location();
    location.onLocationChanged.listen(
      (currentLocation) {
        // print(currentLocation.latitude);
        // print(currentLocation.longitude);
        setState(
          () {
            latLng = LatLng(
              currentLocation.latitude ?? 0,
              currentLocation.longitude ?? 0,
            );
          },
        );
        print("getLocation:$latLng");
        // loading = false;
      },
    );
  }

  final Set<Marker> _markers = {};
  void _onAddMarkerButtonPressed() {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId("111"),
            position: latLng,
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      },
    );
    // setState(
    //   () {
    //     _markers.add(
    //       Marker(
    //         markerId: MarkerId('Driver'),
    //         // position: LatLng(25.540539431310854, 84.85082954594253),
    //         position: latLng,
    //         icon: sourceIcon,
    //         infoWindow: InfoWindow(
    //           title: 'Building Name',
    //           snippet: 'Locality Name, Area, Pincode',
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    for (var i = 2; i < lList.length; i++) {
      lList[i] += lList[i - 2];
    }
    print(lList.toString());
    return lList;
  }

  final Set<Polyline> _polyLines = {};
  Set<Polyline> get polyLines => _polyLines;
  void createRoute(String encondedPoly) {
    _polyLines.add(
      Polyline(
        polylineId: PolylineId(latLng.toString()),
        width: 4,
        points: _convertToLatLng(_decodePoly(encondedPoly)),
        color: Colors.red,
      ),
    );
  }

  // ignore: prefer_final_fields
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();

  // void sendRequest() async {
  //   LatLng destination = LatLng(20.008751, 73.780037);
  //   res.GoogleMapServices route =
  //       await _googleMapsServices.getRouteCoordinates(latLng, destination);
  //   createRoute(
  //     route.routes[0].legs[0].startLocation.lat.toString(),
  //   );
  //   // _addMarker(destination, "KTHM Collage");
  // }

  // void displayDirections() async {
  //   late res.GoogleMapServices route;

  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   polylinePoints = PolylinePoints();

  //   Geolocator.getPositionStream().listen((p) {
  //     setState(() {
  //       _position = p;
  //     });
  //   });

  //   setCustomMarker();
  // }

  void setCustomMarker() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'UIAssets/ic_current.png',
    );
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller = controller;
  // setState(() {
  //   _markers.add(
  //     Marker(
  //       markerId: MarkerId('Driver'),
  //       position: LatLng(25.540539431310854, 84.85082954594253),
  //       icon: sourceIcon,
  //       infoWindow: InfoWindow(
  //         title: 'Building Name',
  //         snippet: 'Locality Name, Area, Pincode',
  //       ),
  //     ),
  //   );
  // });
  // }

  // @override
  // void dispose() {
  //   _controller_;
  //   super.dispose();
  // }

  late GoogleMapController _Pathmapcontroller;

  List<Marker> pathMarkers = [];
  MapsRoutes route = MapsRoutes();
  String googleApiKey = 'AIzaSyASODipwXRfzJNuFRN8lCaQeMnxLXSOvgQ';
  String totalDistance = 'No route';

  Map mapdata = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        // polylines: polyLines,
        mapType: MapType.normal,
        markers: Set.from(pathMarkers),
        myLocationEnabled: true,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        polylines: route.routes,
        // onMapCreated: _onMapCreated,
        onMapCreated: (controller) async {
          List<LatLng> points = [
            LatLng(19.0508, 73.0684),
            LatLng(19.045774, 73.081144),
            LatLng(19.032499, 73.066484),
          ];
          await route.drawRoute(
            points,
            'Test routes',
            Color(0Xff4C6EE5),
            googleApiKey,
            travelMode: TravelModes.driving,
          );
          setState(
            () {
              _Pathmapcontroller = controller;
              addCurrentLocation();
              adddestination();
              addPickupLocation();
            },
          );
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            _position?.latitude ?? 0,
            _position?.longitude ?? 0,
          ),
          zoom: 11.0,
        ),
        // ),
        // body: GoogleMap(
        //   mapType: MapType.normal,
        //   myLocationEnabled: true,
        //   compassEnabled: true,
        //   tiltGesturesEnabled: false,
        //   polylines: _polylines,
        // initialCameraPosition: CameraPosition(
        //   target: LatLng(
        //     _position?.latitude ?? 0,
        //     _position?.longitude ?? 0,
        //   ),
        //   zoom: 14,
        // ),
        //   onMapCreated: (GoogleMapController controller) {
        //     _controller;
        //   },
        //   markers: {
        //     Marker(
        //       markerId: MarkerId('driver'),
        //       position: LatLng(
        //         _position?.latitude ?? 0,
        //         _position?.longitude ?? 0,
        //       ),
        //     )
        //   },
        // ),
      ),
      floatingActionButton: Align(
        
        alignment: Alignment(1, -0.48),
        child: FloatingActionButton.small(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () async {
            mapdata = await GoogleMapsServices().getRouteCoordinates(
              LatLng(25.540539431310854, 84.85082954594253),
              LatLng(25.533609, 84.855555),
            );
            _Pathmapcontroller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(25.540539431310854, 84.85082954594253),
                  zoom: 16,
                ),
              ),
            );
          },
          child: Icon(
            Icons.near_me_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  void addCurrentLocation() {
    setState(
      () {
        pathMarkers.add(
          Marker(
            markerId: MarkerId('myLocation'),
            position: LatLng(25.540539431310854, 84.85082954594253),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueCyan,
            ),
          ),
        );
      },
    );

    CameraPosition cameraposition = CameraPosition(
      target: LatLng(25.540539431310854, 84.85082954594253),
      zoom: 11,
    );
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
            position: LatLng(
              25.537060,
              84.852352,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange,
            ),
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
            position: LatLng(
              25.526901, 84.851830,
              // 25.531146,
              // 84.854279,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRose,
            ),
          ),
        );
      },
    );
  }
}
