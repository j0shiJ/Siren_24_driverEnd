// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:siren24/Menu_Bar.dart/Settings/profileeditpage.dart';
import 'package:siren24/global/globalvariables.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static String id = 'profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => Scaffold(
          drawer: MenuBar(),
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(
                        context, ProfileEditPage.id);
                  });
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xFFFF8900),
                    fontSize: 20.sp,
                    fontFamily: 'SF UI Display',
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Color(0xFFFFD428),
            ),
          ),
          backgroundColor: Color(0xFFF7F8FA),
          body: Column(
            children: [
              Container(
                height: 150.h,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            // child: Image.asset(
                            //   'UIAssets/dp.png',
                            //   scale: 1,
                            // ),
                            child: Image.network(
                              userdata['profile_img'],
                              fit: BoxFit.fill,
                            ),
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            // 'Username',
                            userdata['name'],
                            style: TextStyle(
                              fontFamily: 'SF UI Display',
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.h,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
              ),
              Container(
                height: 42,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    'INFORMATIONS',
                    style: TextStyle(
                      color: Color(0xFFBEC2CE),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF UI Display',
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              Container(
                height: 1.h,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
              ),
              Container(
                color: Colors.white,
                height: 190.25.h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 10,
                        top: 7,
                        bottom: 7,
                      ),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontFamily: 'SF UI Display',
                                          fontSize: 20.sp,
                                          color: Color(0xFF030303),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                // 'Username'
                                userdata['name'],
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontSize: 20.sp,
                                  color: Color(0xFFBEC2CE),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFFBEC2CE),
                                    size: 21,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, top: 7, bottom: 7),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Phone number',
                                        style: TextStyle(
                                          fontFamily: 'SF UI Display',
                                          fontSize: 20.sp,
                                          color: Color(0xFF030303),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                userdata['phoneno'].toString(),
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontSize: 20.sp,
                                  color: Color(0xFFBEC2CE),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFFBEC2CE),
                                    size: 21,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, top: 7, bottom: 7),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gender',
                                        style: TextStyle(
                                          fontFamily: 'SF UI Display',
                                          fontSize: 20.sp,
                                          color: Color(0xFF030303),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                // 'Gender',
                                userdata['gender'],
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontSize: 20.sp,
                                  color: Color(0xFFBEC2CE),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFFBEC2CE),
                                    size: 21,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18),
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 10, top: 7, bottom: 7),
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Birthday',
                                        style: TextStyle(
                                          fontFamily: 'SF UI Display',
                                          fontSize: 20.sp,
                                          color: Color(0xFF030303),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                // 'DOB',
                                userdata['dob'],
                                style: TextStyle(
                                  fontFamily: 'SF UI Display',
                                  fontSize: 20.sp,
                                  color: Color(0xFFBEC2CE),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Color(0xFFBEC2CE),
                                    size: 21,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
