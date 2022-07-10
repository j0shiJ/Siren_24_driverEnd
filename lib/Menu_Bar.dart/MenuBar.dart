// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/GoogleMaps/HomeOffline.dart';
import 'package:siren24/Invite%20Friends/InviteFriends.dart';
import 'package:siren24/Menu_Bar.dart/Notifications.dart';
import 'package:siren24/MyWallet/MyWallet.dart';
import 'package:siren24/documents/documentpage.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/history/history.dart';
import 'package:siren24/signup/signin.dart';
import 'package:siren24/vehicle_management/vehicle_management.dart';

import 'Settings/Settings.dart';

class MenuBar extends StatefulWidget {
  static String id = 'menu_bar';
  const MenuBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Drawer(
        child: ListView(
          children: [
            Container(
              height: 170.h,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFFD428),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 5.h,
                          top: 5.h,
                          left: 5.w,
                          right: 5.w,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            // Image.asset(
                            //   'UIAssets/dp.png',
                            //   scale: 0.75,
                            // ),
                            Container(
                              height: 50.h,
                              width: 50.w,
                              child: Image.network(
                                userdata['profile_img'],
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Text(
                                    userdata['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),

                                //*********************************************************************************//

                                //Gold Member
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFD428),
                                          size: 13.sp,
                                        ),
                                        Text(
                                          '4.5/5',
                                          style: TextStyle(
                                            color: Color(0xFFFFD428),
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        SizedBox(width: 5.w,),
                                        Text(
                                          'Gold Member',
                                          style: TextStyle(
                                            color: Color(0xFFFFD428),
                                            fontSize: 13.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                //*********************************************************************************//
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.black,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 17.h,
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Hours online',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFF242E42),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              // width: 2.w,
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
                                  '0 KM',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 17.h,
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Total Distance',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFF242E42),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
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
                                  '0',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 17.h,
                                  child: Expanded(
                                    child: Center(
                                      child: Text(
                                        'Total Jobs',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xFF242E42),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.w, top: 5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/home.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Home',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(context, HomeOffline.id,
                          );
                        },
                      );
                    },
                  ),
                  // ListTile(
                  //   title: Row(
                  //     children: [
                  //       Image.asset(
                  //         'UIAssets/wallet.png',
                  //         color: Color(0xFFD8D8D8),
                  //         scale: 1,
                  //       ),
                  //       SizedBox(
                  //         width: 10.w,
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           'My Wallet',
                  //           overflow: TextOverflow.fade,
                  //           style: TextStyle(
                  //             fontSize: 17.sp,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     setState(
                  //       () {
                  //         Navigator.pushReplacementNamed(context, MyWallet.id);
                  //       },
                  //     );
                  //   },
                  // ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/History.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'History',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      try {
                        // history_data = await ApiCaller().historydata();
                        Navigator.pushNamed(context, History.id);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/notification.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Notifications',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(
                            context,
                            Notifications.id
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/Vehicle.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Vehicle Management',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      ambulance_details = await ApiCaller().get_ambulance();
                      print(ambulance_details);
                      setState(
                        () {
                          Navigator.pushNamed(
                            context,
                            VehicleManagement.id
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/ID contact.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Document Management',
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // ambulance_details = await ApiCaller().get_ambulance() ;
                      // print(ambulance_details) ;
                      setState(
                        () {
                          Navigator.pushNamed(
                              context, DocumentsUpload.id);
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/gift.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Invite Friends',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(
                            context,
                            InviteFriends.id
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/settings.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Settings',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(
                            context,
                            Settings.id
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Image.asset(
                          'UIAssets/logout.png',
                          color: Color(0xFFD8D8D8),
                          scale: 1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            'Logout',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () async {
                      // FirebaseMessaging.instance
                      //     .unsubscribeFromTopic(phonenumber);
                      String x = await ApiCaller().logout();
                      setState(() async{
                        firsttimechecker = 0;
                        history_data = [];
                        ambulance_details = [];
                        userdata = {};
                        print("done");
                        print(x);
                        final SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.remove('driverPhoneNumber');
                        preferences.remove('authToken') ;
                        preferences.remove('userID') ;
                        Navigator.pushNamed(context, SignIn.id);
                      });
                    },
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
