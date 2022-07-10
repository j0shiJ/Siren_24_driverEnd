// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'MenuBar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static String id = 'notifications';

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Scaffold(
        drawer: MenuBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFFFD428)),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 18.h,
            ),
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF4252FF),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4252FF),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'UIAssets/tick.png',
                                      color: Colors.white,
                                      scale: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'System',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Booking #1234 has been success...',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD428),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'UIAssets/promo.png',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Promotion',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Invite friends - Get 3 coupons each!',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD428),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'UIAssets/promo.png',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Promotion',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Invite friends - Get 3 coupons each!',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF4CE5B1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'UIAssets/wallet.png',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'System',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Thank you! Your transaction is com...',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFF52D56),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'UIAssets/close.png',
                                      color: Color(0xFFF52D56),
                                      scale: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'System',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Booking #1234 has been cancelled',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
            Container(
              height: 96.h,
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFD428),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'UIAssets/promo.png',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Promotion',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Invite friends - Get 3 coupons each!',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
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
      ),
    );
  }
}
