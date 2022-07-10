// ignore_for_file: file_names, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_local_variable
// ignore_for_file: prefer_const_constructors, unused_import, file_names

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:geolocator/geolocator.dart';
import 'package:siren24/GoogleMaps/GMaps_HomePickUp.dart';
import 'package:siren24/GoogleMaps/directions.dart';
// import 'package:siren24/GoogleMaps/globalVariableGoogleMapsPickup.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'GMaps_HomeOffline.dart';

class HomePickUp extends StatefulWidget {
  const HomePickUp({Key? key}) : super(key: key);
  static String id = 'HomePickUp';
  @override
  _HomePickUpState createState() => _HomePickUpState();
}

class _HomePickUpState extends State<HomePickUp> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MenuBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              bottom: PreferredSize(
                child: PickUpNotif(),
                preferredSize: Size.fromHeight(48),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Pick Up',
                style: TextStyle(
                  fontFamily: 'SF UI Display',
                  fontSize: MediaQuery.of(context).size.aspectRatio * 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SlidingPanelHomePickUp(
        child: GMapsHomePickUp(),
      ),
    );
  }
}

class SlidingPanelHomePickUp extends StatefulWidget {
  final Widget child;
  const SlidingPanelHomePickUp({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<SlidingPanelHomePickUp> createState() => _SlidingPanelHomePickUpState();
}

class _SlidingPanelHomePickUpState extends State<SlidingPanelHomePickUp> {
  // // late HtmlDocument htmlDirections;
  // static const htmlData =
  //     """Head <b>south</b> on <b>S Federal St</b> toward <b>W Van Buren St</b>""";

  // dom.Document document = htmlparser.parse(htmlData);

  // /// sanitize or query document here
  // // Widget html = Html(
  // //   document: document, data: '',
  // // );

  String? htmlData;
  Map mapdata = {};

  int eta = 0;
  double dist = 0;
  double fare = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      boxShadow: [BoxShadow(blurRadius: 0)],
      borderRadius: BorderRadius.circular(15),
      minHeight: 15,
      maxHeight: 500,
      body: widget.child,
      panel: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
                width: 36,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xFFCBCDCC),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    Image.asset('UIAssets/dp.png'),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick up at',
                          style: TextStyle(
                            color: Color(0xFFBEC2CE),
                          ),
                        ),
                        Text(
                          '7958 Swift Village',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 1,
            color: Color(0xFF242A37),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              mapdata = await GoogleMapsServices().getRouteCoordinates(
                LatLng(25.540539431310854, 84.85082954594253),
                LatLng(25.533609, 84.855555),
              );
              setState(
                () {
                  eta = int.parse(mapdata["routes"][0]["legs"][0]["duration"]
                          ["value"] /
                      60);
                  dist = mapdata["routes"][0]["legs"][0]["distance"]["value"] /
                      1000;
                  htmlData = mapdata["routes"][0]["legs"][0]["steps"][0]
                      ["html_instructions"];
                  // htmlData = """z""";
                },
              );
            },
            child: Container(
              width: 325,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFFFFD428),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'DROP OFF',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFD428),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ETA',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 24,
                            ),
                          ),
                          Text(
                            (DateTime.now().hour +
                                        (DateTime.now().minute + eta) ~/ 60)
                                    .toString() +
                                ':' +
                                ((DateTime.now().minute + eta) % 60)
                                    .toString() +
                                ' AM',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Distance',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 24,
                            ),
                          ),
                          Text(
                            dist.toString() + ' Km',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Fare',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 24,
                            ),
                          ),
                          Text(
                            '₹ ' + fare.toString(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),

          SizedBox(
            height: 15,
          ),
          // Container(
          //   width: 1,
          //   color: Color(0xFFEFEFF4),
          // ),
          // Html(
          //   data: htmlData,
          // ),
        ],
      ),
    );
  }
}

class PickUpNotif extends StatelessWidget {
  const PickUpNotif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFFF8900),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.subdirectory_arrow_right),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '250m',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Turn right at 105 William St, Chicago, US',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
