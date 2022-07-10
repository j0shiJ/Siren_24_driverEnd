// ignore_for_file: sized_box_for_whitespace

import 'package:shared_preferences/shared_preferences.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/optverification/otpverification.dart';
import 'package:siren24/signup/referalcode.dart';
import 'package:siren24/signup/signin.dart';
import 'package:flutter/material.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static String id = 'SignUp';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              color: const Color(0xffF7F8FA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  //Sign Up card
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Container(
                            height: 494.h,
                            width: 345.w,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                //Sign Up Stack
                                Stack(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xffFFD428),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10)),
                                      ),
                                      height: 278.h,
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 100.h,
                                      child: Image.asset(
                                        'images/img1.png',
                                        scale: 0.75,
                                      ),
                                    ),
                                    Positioned(
                                      right: -7.w,
                                      top: 180.h,
                                      child: Image.asset(
                                        'images/img2.png',
                                        scale: 0.75,
                                      ),
                                    ),
                                    Positioned(
                                      right: 168.w,
                                      top: 180.h,
                                      child: Image.asset(
                                        'images/img3.png',
                                        scale: 0.75,
                                      ),
                                    ),

                                    //Sign Up text
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.w, 30.h, 77.w, 107.h),
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 34.sp,
                                            color: const Color(0xff242A37),
                                          ),
                                          children: const [
                                            TextSpan(
                                              text: "Sign Up ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  'with email and phone number',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //Bottom half of Sign Up card
                                Container(
                                  height: 200.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      //Email ID form field
                                      // Padding(
                                      //   padding: EdgeInsets.fromLTRB(
                                      //       20.w, 30.h, 20.w, 10.h),
                                      //   child: SizedBox(
                                      //     width: 305.w,
                                      //     height: 45.h,
                                      //     child: TextField(
                                      //       style: TextStyle(
                                      //         fontSize: 17.sp,
                                      //         height: 1.5,
                                      //         fontWeight: FontWeight.bold,
                                      //       ),
                                      //       cursorColor:
                                      //           const Color(0xffFFD428),
                                      //       decoration: InputDecoration(
                                      //         // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
                                      //         hintText: 'name@example.com',
                                      //         hintStyle: const TextStyle(
                                      //           // fontSize: 20,
                                      //           fontWeight: FontWeight.normal,
                                      //           color: Color(0xffBEC2CE),
                                      //         ),
                                      //         enabledBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //           borderSide: const BorderSide(
                                      //             width: 2,
                                      //             color: Color(0xffEFEFF4),
                                      //           ),
                                      //         ),
                                      //         focusedBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //           borderSide: const BorderSide(
                                      //             width: 2,
                                      //             color: Color(0xffEFEFF4),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      //Sized Box
                                      SizedBox(
                                        height: 20.h,
                                      ),

                                      //Phone Number text form field
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            20.w, 10.h, 20.w, 20.h),
                                        child: SizedBox(
                                          width: 305.w,
                                          height: 45.h,
                                          child: TextField(
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  _phoneNumber = value;
                                                  phonenumber = value;
                                                },
                                              );
                                              print(_phoneNumber);
                                            },
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              height: 1.5,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                const Color(0xffFFD428),
                                            decoration: InputDecoration(
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 5.w,
                                                    left: 20.w,
                                                    top: 7.h,
                                                    bottom: 7.h),
                                                child: Text(
                                                  '+91 ',
                                                  style: TextStyle(
                                                    fontSize: 17.sp,
                                                    height: 1.5,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              hintText:
                                                  "Enter your phone number",
                                              hintStyle: TextStyle(
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.normal,
                                                color: const Color(0xffBEC2CE),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                left: 30.w,
                                                right: 20.w,
                                                top: 0.h,
                                                bottom: 0.h,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Color(0xffEFEFF4),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Color(0xffEFEFF4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      //Referal code button
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20.w, 20.h, 10.w, 30.h),
                                            child: GestureDetector(
                                              onTap: () => Referral_Code(),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff242A37),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                width: 142.5.w,
                                                height: 45.h,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'REFERAL CODE',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.w, 20.h, 20.w, 30.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(
                                                  () async {
                                                    var pnumber =
                                                        int.parse(_phoneNumber);
                                                    if (_phoneNumber.length ==
                                                        10) {
                                                      ApiCaller()
                                                          .sendOtpToPhone(
                                                              pnumber, 2);
                                                      final SharedPreferences
                                                          preferences =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      preferences.setString(
                                                        'driverPhoneNumber',
                                                        _phoneNumber,
                                                      );
                                                      firsttimechecker = 0;
                                                      Navigator.pushNamed(
                                                        context,
                                                        OtpVerification.id,
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: _phoneNumber.length !=
                                                          10
                                                      ? const Color(0x80242A37)
                                                      : const Color(0xff242A37),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                width: 142.5.w,
                                                height: 45.h,
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'SIGN UP',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      //Sign Up Button
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

                  SizedBox(
                    //Changes
                    height: 120.h,
                  ),

                  //To Sign In page
                  Container(
                    height: 15.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 13.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                Navigator.pushNamed(context, SignIn.id);
                              },
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Colors.white,

                    //Changes
                    height: 25.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
