import 'dart:async';
// import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:siren24/GoogleMaps/HomeOffline.dart';
import 'package:siren24/Menu_Bar.dart/Settings/Profile.dart';
import 'package:siren24/Menu_Bar.dart/Settings/ProfileEdit.dart';
import 'package:siren24/Menu_Bar.dart/Settings/profileeditpage.dart';
import 'package:siren24/Onboarding%20Screens/SetupGPSLocations.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/ForAPI/apicalling.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);
  static String id = 'OtpVerification';

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  bool hasError = false;
  String _currentText = "";

  double width = 0;

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }



  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
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
            body: Stack(
              // clipBehavior: Clip.none,
              children: [
                Container(
                  width: 375.w,
                  height: 812.h,
                  color: Colors.white,
                ),
                Container(
                  width: 375.w,
                  height: 271.h,
                  color: const Color(0xffFFD428),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'images/img1.png',
                          scale: 0.65,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Image.asset(
                          'images/img22.png',
                          scale: 0.75,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(
                          'images/img3.png',
                          scale: 0.83,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // top: MediaQuery.of(context).size.height*0.27 - 85,
                  top: 210.h,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      15.w,
                      10.h,
                      15.w,
                      10.h,
                    ),
                    child: Container(
                      width: 345.w,
                      height: 393.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15.0,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height*0.04,
                          // ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 6.h),
                            child: Text(
                              'Phone Verification',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 34.sp,
                                color: const Color(0xff242A37),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.w, 7.h, 30.w, 30.h),
                            child: Text(
                              'Enter your OTP code here',
                              style: TextStyle(
                                fontSize: 17.sp,
                              ),
                            ),
                          ),

                          // SizedBox(
                          //   height: 20,
                          // ),

                          //Pin Code
                          SizedBox(
                            height: 130.h,
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: PinCodeTextField(
                                animationType: AnimationType.none,
                                appContext: context,
                                length: 6,
                                onChanged: (value) {
                                  setState(() {
                                    _currentText = value;
                                  });
                                },
                                textStyle: TextStyle(
                                  fontSize: 30.sp,
                                ),
                                showCursor: false,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  activeColor: const Color(0xffD8D8D8),
                                  inactiveColor: const Color(0xffD8D8D8),
                                  selectedColor: const Color(0xffD8D8D8),
                                  borderWidth: 5,
                                  fieldWidth: 35.w,
                                ),
                              ),
                            ),
                          ),

                          //Verify Button
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                            child: GestureDetector(
                              onTap: () {
                                if (_currentText.length == 6) {
                                  setState(
                                    () async {
                                      var _otp = int.parse(_currentText);
                                      int x = await ApiCaller().verifyOtp(_otp);
                                      if (x < 300) {
                                        // String? firebasetoken = await FirebaseMessaging.instance.getToken();
                                        // print("1") ;
                                        // String? y = await ApiCaller().registrationtoken(firebasetoken!) ;
                                        // print("2") ;
                                        // FirebaseMessaging.onMessageOpenedApp.toString();
                                        // print("token:"+ firebasetoken + " message:" + y ) ;
                                        print(phonenumber);
                                        FirebaseMessaging.instance.subscribeToTopic(phonenumber);
                                      //   Firebase.messaging.subscribeToTopic("weather")
                                      //       .addOnCompleteListener { task ->
                                      // var msg = getString(R.string.msg_subscribed)
                                      // if (!task.isSuccessful) {
                                      // msg = getString(R.string.msg_subscribe_failed)
                                      // }
                                      // Log.d(TAG, msg)
                                      // Toast.makeText(baseContext, msg, Toast.LENGTH_SHORT).show()
                                      // }
                                        print("work");
                                        userdata = await ApiCaller().user_profile() ;
                                        Navigator.pushNamed(context, SetupGPSLocations.id) ;
                                      } else {

                                        // Scaffold.of(context).showSnackBar(snackBar);
                                        const snackBar = SnackBar(
                                          content: Text(
                                              'THE OTP ENTERED IS INCORRECT'),
                                          duration: Duration(seconds:3),
                                        );
                                        // Scaffold.of(context).showSnackBar(snackBar);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                  );
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: _currentText.length != 4 ? Color(0xff242A37):Color(0xffFFD428),
                                  color: _currentText.length != 6
                                      ? const Color(0x80FFD428)
                                      : const Color(0xffFFD428),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 60,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'VERIFY NOW',
                                      style: TextStyle(
                                        // color: Colors.white,
                                        color: _currentText.length != 6
                                            ? Colors.white
                                            : const Color(0xff242A37),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
