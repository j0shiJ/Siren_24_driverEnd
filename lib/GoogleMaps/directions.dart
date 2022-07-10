// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

const apiKey = "AIzaSyASODipwXRfzJNuFRN8lCaQeMnxLXSOvgQ";

class GoogleMapsServices {
  // Future<Map> getRouteCoordinates(LatLng driver, LatLng user) async {
  //   Uri url =
  //       "https://maps.googleapis.com/maps/api/directions/json?origin=${driver.latitude},${driver.longitude}&destination=${user.latitude},${user.longitude}&key=$apiKey"
  //           as Uri;
  //   http.Response response = await http.get(url);
  //   Logger().d(response.body) ;
  //   Map values = jsonDecode(response.body);
  //   return values;
  // }
  Future<Map> getRouteCoordinates(LatLng driver, LatLng user) async {
    var response = await http.post(Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?origin=${driver.latitude},${driver.longitude}&destination=${user.latitude},${user.longitude}&key=$apiKey"));
    Logger().d(response.body);
    Map values = jsonDecode(response.body);
    return values;
  }
}

class OpenGoogleMaps {
  OpenGoogleMaps._();
  static Future<void> openMap(double lat, double lng) async {
    String googleMapsURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    if (await canLaunch(googleMapsURL)) {
      await launch(googleMapsURL);
    } else {
      throw 'Couldn\'t connect to Google Maps';
    }
  }
}