// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/Menu_Bar.dart/Settings/Profile.dart';
import 'package:siren24/documents/documentpage.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/vehicle_management/vehicle_management.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MenuBar.dart';
import '../Notifications.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static String id = 'settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Scaffold(
        drawer: MenuBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFFFD428)),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Settings',
            style: TextStyle(
              fontFamily: 'SF UI Display',
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 2.h,
            ),
            Container(
              height: 20.h,
            ),
            Container(
              height: 2.h,
            ),
            Container(
              height: 600.h,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context,
                           Profile.id);
                      });
                    },
                    child: Container(
                      height: 90.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 10,
                          top: 12,
                          bottom: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 60.h,
                                      width: 60.w,
                                      child: Image.network(
                                        userdata['profile_img'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userdata['name'],
                                          style: TextStyle(
                                            fontFamily: 'SF UI Display',
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                        // Text(
                                        //   'Gold Member',
                                        //   style: TextStyle(
                                        //     fontSize: 18.sp,
                                        //     color: Color(0xFFBEC2CE),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.grey[400],
                                  size: 36.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                  ),
                  Container(
                    height: 20.h,
                  ),
                  Container(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(
                              context, VehicleManagement.id);
                        },
                      );
                    },
                    child: Container(
                      height: 50.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            left: 7,
                                            right: 15,
                                          ),
                                          child: Container(
                                            width: 30.w,
                                            height: 36.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF9100),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/Vehicle.png',
                                                scale: 1.2,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Vehicle Management',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.grey[400],
                                  size: 36.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 54),
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, DocumentsUpload.id);
                    },
                    child: Container(
                      height: 50.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            left: 7,
                                            right: 15,
                                          ),
                                          child: Container(
                                            width: 30.w,
                                            height: 36.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF4CD964),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/ID contact.png',
                                                color: Colors.white,
                                                scale: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Document Management',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.grey[400],
                                  size: 36.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 54),
                    height: 2.h,
                  ),
                  Container(
                    height: 50.h,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 7,
                                          right: 15,
                                        ),
                                        child: Container(
                                          width: 30.w,
                                          height: 36.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFCC00),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'UIAssets/Favorites.png',
                                              scale: 1.5,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Reviews',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.grey[400],
                                size: 36.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 54),
                    height: 2.h,
                  ),
                  Container(
                    height: 50.h,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 7,
                                          right: 15,
                                        ),
                                        child: Container(
                                          width: 30.w,
                                          height: 36.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF007AFF),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'UIAssets/Place.png',
                                              scale: 1.5,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Language',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.grey[400],
                                size: 36.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                  ),
                  Container(
                    height: 20.h,
                  ),
                  Container(
                    height: 2.h,
                  ),
                  // GestureDetector(
                  //   // onTap: () {
                  //   //   setState(() {
                  //   //     Navigator.push(
                  //   //       context,
                  //   //       MaterialPageRoute(
                  //   //         builder: (context) => Notifications(),
                  //   //       ),
                  //   //     );
                  //   //   });
                  //   // },
                  //   child: Container(
                  //     height: 50.h,
                  //     color: Colors.white,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 10, right: 10),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceEvenly,
                  //                 children: [
                  //                   Stack(
                  //                     children: <Widget>[
                  //                       Padding(
                  //                         padding: const EdgeInsets.only(
                  //                           top: 3,
                  //                           bottom: 3,
                  //                           left: 7,
                  //                           right: 15,
                  //                         ),
                  //                         child: Container(
                  //                           width: 30.w,
                  //                           height: 36.h,
                  //                           decoration: BoxDecoration(
                  //                             color: Color(0xFF5AC8FA),
                  //                             borderRadius:
                  //                                 BorderRadius.circular(6),
                  //                           ),
                  //                           child: Align(
                  //                             alignment: Alignment.center,
                  //                             child: Image.asset(
                  //                               'UIAssets/notification.png',
                  //                               scale: 1.5,
                  //                               color: Colors.white,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   Column(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Notifications',
                  //                         style: TextStyle(
                  //                           fontFamily: 'SF Pro Text',
                  //                           fontSize: 20.sp,
                  //                           color: Colors.black,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.end,
                  //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             children: [
                  //               Icon(
                  //                 Icons.keyboard_arrow_right_rounded,
                  //                 color: Colors.grey[400],
                  //                 size: 36.sp,
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 54),
                  //   height: 2.h,
                  // ),
                  Container(
                    height: 50.h,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Stack(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 7,
                                          right: 15,
                                        ),
                                        child: Container(
                                          width: 30.w,
                                          height: 36.h,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8F8E94),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'UIAssets/vip center.png',
                                              scale: 1.5,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Terms & Privacy Policy',
                                        style: TextStyle(
                                          fontFamily: 'SF Pro Text',
                                          fontSize: 20.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.grey[400],
                                size: 36.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 54),
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await launch('tel:+91 9910295915');
                    },
                    child: Container(
                      height: 50.h,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            left: 7,
                                            right: 15,
                                          ),
                                          child: Container(
                                            width: 30.w,
                                            height: 36.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFF2D55),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/help.png',
                                                color: Colors.white,
                                                scale: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Contact us',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'SF Pro Text',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.grey[400],
                                  size: 36.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
