// ignore_for_file: unused_import, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/global/globalvariables.dart';
// import 'package:share_plus/share_plus.dart';
import '../Menu_Bar.dart/MenuBar.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);
  static String id = 'invite_friends';

  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  String invitecode = "0905070017";

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: invitecode)).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[100],
          duration: Duration(milliseconds: 1000),
          elevation: 5,
          margin: EdgeInsets.only(
            bottom: 75.h,
            left: 115.w,
            right: 115.w,
            top: 675.h,
          ),
          behavior: SnackBarBehavior.floating,
          content: Center(
            child: Text(
              'Copied to clipboard',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Scaffold(
        drawer: MenuBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFFFD428)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              'Invite Friends',
              style: TextStyle(
                fontSize: 24.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 240,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFD428),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Align(
                            child: Image.asset(
                              'UIAssets/teamwork.png',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Column(
                    children: [
                      Text(
                        'Invite Friends',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 36.sp,
                        ),
                      ),
                      Text(
                        'Earn up to ₹150 a day',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 36.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'When your friend sign up with your',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          'referral code, you can receive up to',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          '\$150 a day.',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Row(
                      children: [
                        Text(
                          'SHARE YOUR INVITE CODE',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Color(0xFFBEC2CE),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      _copyToClipboard();
                    },
                    child: Container(
                      width: 300.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F2F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          userdata['referral_code'] == null ? " " :
                          // invitecode,
                          userdata['referral_code'],
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                        'Siren 24 demo Invite Friends share plugin',   
                      );
                    },
                    child: Container(
                      width: 300.w,
                      height: 54.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD428),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'INVITE',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
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
