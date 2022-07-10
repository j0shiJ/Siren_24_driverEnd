// ignore_for_file: file_names, duplicate_ignore, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, must_be_immutable
// ignore_for_file: prefer_const_constructors, unused_import, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/GoogleMaps/GMaps_HomePickUp.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siren24/bookingdetails/bookingdetailsafter.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'GMaps_HomeOffline.dart';

class HomeOffline extends StatefulWidget {
  const HomeOffline({Key? key}) : super(key: key);
  static String id = 'HomeOffline';
  @override
  _HomeOfflineState createState() => _HomeOfflineState();
}

class _HomeOfflineState extends State<HomeOffline> {
  bool status = false;
  String driverStatus = 'OFFLINE';
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: MenuBar(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(110.h),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: AppBar(
                  iconTheme: IconThemeData(
                    color: Color(0xFFFFD428),
                  ),
                  bottom: PreferredSize(
                    child: isOnline ? Text('') : OfflineNotif(),
                    preferredSize: Size.fromHeight(48.h),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    driverStatus,
                    style: TextStyle(
                      fontFamily: 'SF UI Display',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    FlutterSwitch(
                      activeColor: Color(0xFFFF8900),
                      inactiveToggleColor: Colors.white,
                      activeToggleColor: Colors.white,
                      width: 62.w,
                      height: 42.h,
                      valueFontSize: 25.0,
                      toggleSize: 30,
                      value: status,
                      borderRadius: 30.0,
                      padding: 3,
                      showOnOff: false,
                      onToggle: (val) {
                        isOnline = !isOnline;
                        setState(
                          () {
                            status = val;
                            driverStatus = isOnline
                                ? driverStatus = 'ONLINE'
                                : driverStatus = 'OFFLINE';
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SlidingPanelHomeOffline(
            child: GMapsHomeOffline(),
          ),
        ),
      ),
    );
  }
}

class SlidingPanelHomeOffline extends StatelessWidget {
  final Widget child;
  String modeOfPayment = 'Online';
  bool isCash = false;
  SlidingPanelHomeOffline({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      boxShadow: [
        BoxShadow(
          blurRadius: 0,
        ),
      ],
      borderRadius: BorderRadius.circular(15),
      minHeight: 100.h,
      maxHeight: 200.h,
      body: child,
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
                    // Image.asset('UIAssets/dp.png'),
                    Container(
                      height: 50.h,
                      width: 45.w,
                      child: Image.network(
                        userdata['profile_img'],
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Jeremiah Curtis',
                          userdata['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'ALC AMB',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xFFBEC2CE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Center(
                            child: Text('Payment'),
                          ),
                          // content: Text('Rs. 350'),
                          actions: <Widget>[
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Amount: ₹ 20'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Amount already Paid: ₹ 20'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Mode of Payment - ' +
                                      (modeOfPayment =
                                          isCash ? 'Cash' : 'Online')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Amount to be Paid: ₹ 0'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) => Color(0xFFFFD428),
                                ),
                              ),
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, BookingDetailsAfter.id);
                      },
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD428),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Center(
                          child: Text(
                            'Earned',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                          Icon(
                            Icons.access_time,
                            color: Colors.black,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Hours online',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize: 14.sp,
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
                          Icon(
                            Icons.speed,
                            color: Colors.black,
                          ),
                          Text(
                            '00 KM',
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total Distance',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize: 14.sp,
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
                          Icon(
                            Icons.speed,
                            color: Colors.black,
                          ),
                          Text(
                            '00',
                            style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total Jobs',
                            style: TextStyle(
                              color: Color(0xFF242E42),
                              fontSize: 14.sp,
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
        ],
      ),
    );
  }
}

class OfflineNotif extends StatelessWidget {
  const OfflineNotif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Container(
        height: 68.h,
        decoration: BoxDecoration(
          color: Color(0xFFFF8900),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 1,
                      ),
                      Image.asset(
                        'UIAssets/ic_moon.png',
                        scale: 1.1,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You are offline !',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Go online to start accepting jobs.',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
