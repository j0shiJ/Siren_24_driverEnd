// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_catches, unused_local_variable, unused_import, avoid_print, unused_element, unused_field, implementation_imports

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/GoogleMaps/homeOffline.dart';
import 'package:siren24/Menu_Bar.dart/Settings/profileeditpage.dart';
import 'package:siren24/MyWallet/MyWallet.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/history/history.dart';
import 'package:siren24/signup/signupmod.dart';
import 'package:siren24/vehicle_management/vehicle_management.dart';

class SetupGPSLocations extends StatefulWidget {
  const SetupGPSLocations({Key? key}) : super(key: key);
  static String id = 'setup_gps_locations';

  @override
  _SetupGPSLocationsState createState() => _SetupGPSLocationsState();
}

class _SetupGPSLocationsState extends State<SetupGPSLocations> {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 150.h,
            ),
            Image.asset(
              'UIAssets/enable your location.png',
              scale: 1.5,
            ),
            SizedBox(
              height: 69.h,
            ),
            Text(
              'Enable Your Location',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Choose your location to start find the',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                  Text(
                    'request around you.',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54.h,
            ),
            GestureDetector(
              onTap: () async {
                await _determinePosition();
                if (firsttimechecker == 0) {
                  Navigator.pushNamed(
                    context,
                    ProfileEditPage.id,
                  );
                  // firsttimechecker = 1;
                } else {
                  userdata =
                  await ApiCaller().user_profile();
                  Navigator.pushNamed(
                    context,
                    HomeOffline.id,
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 75),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFFFD428),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    'USE MY LOCATION',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 42,
            ),
            // GestureDetector(
            // onTap: () async {
            //   // final String names = await ApiCaller().user_profile();
            //   // String x = await ApiCaller().addambulance("TR01 KK 9999", "61e2b1e569a5c49180d4ee7c", "ALS", "cooc", "nice", ["oxygen","monitoring"]);
            //   // ambulance_details = await ApiCaller().get_ambulance() ;
            //   history_data = await ApiCaller().historydata();
            //   setState(
            //     () {
            //       Navigator.pushReplacementNamed(context, SignupPage.id);
            //       // if ( x == "ambulance added")
            //       //   {
            //       //     print("done") ;
            //       //   }
            //       // else
            //       //   {
            //       //     print(x) ;
            //       //     print("wrong") ;
            //       //   }
            //       // name = names ;
            //       // print(name) ;
            //       //Update Ambulance
            //       // Future<String> x = ApiCaller().updatelocation(21.3244593, 72.0000101);
            //       // print(x.toString()) ;

            //       //getprofile
            //       // ApiCaller().addambulance("TR01 KK 9999", "61e2b1e569a5c49180d4ee7c", "ALS", "cooc", "nice", "oxygen");
            //       // ApiCaller().user_profile();
            //       // Navigator.pushReplacementNamed(context, VehicleManagement.id) ;

            //       // Navigator.pushReplacementNamed(
            //       //   context,
            //       //   SignupPage.id,
            //       // );
            //     },
            //   );
            // },
            Column(
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 75),
                //   padding: EdgeInsets.symmetric(vertical: 12),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFFFD428),
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //   ),
                // ),
                // SizedBox(
                //   height: 48.h,
                // ),
                Center(
                  child: TextButton(
                    child: Text(
                      'Skip for now',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Color(0xFFBEC2CE),
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () async{
                          if (firsttimechecker == 0) {
                            Navigator.pushNamed(
                              context,
                              ProfileEditPage.id,
                            );
                            // firsttimechecker = 1;
                          } else {
                            userdata =
                                await ApiCaller().user_profile();
                            Navigator.pushNamed(
                              context,
                              HomeOffline.id,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
