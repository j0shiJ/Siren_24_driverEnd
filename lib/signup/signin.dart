import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/optverification/otpverification.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String id = 'SignIn';
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _phonenumber = "";

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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 375.w,
                    height: 812.h,
                    color: Colors.white,
                  ),
                  //background stack
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

                  //Login Card
                  Positioned(
                    // top: MediaQuery.of(context).size.height * 0.3 - 85,
                    top: 210.h,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        15.w,
                        10.h,
                        15.w,
                        10.h,
                      ),

                      //Decoration for login card
                      child: Container(
                        width: 345.w,
                        height: 335.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            //Text
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 30.h),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 34.sp,
                                    color: const Color(0xff242A37),
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Login ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'with your phone number',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //Phone Number text form field
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                              child: SizedBox(
                                width: 305.w,
                                height: 45.h,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        _phonenumber = value;
                                      },
                                    );
                                  },
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  cursorColor: const Color(0xffFFD428),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, left: 20, top: 4),
                                      child: Text(
                                        '+91 ',
                                        style: TextStyle(
                                          fontSize: 17.sp,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    hintText: "Enter your phone number",
                                    hintStyle: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xffBEC2CE),
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        left: 30,
                                        right: 20,
                                        top: 20,
                                        bottom: 20),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Color(0xffEFEFF4),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Color(0xffEFEFF4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Next Button
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
                              child: InkWell(
                                onTap: () {
                                  setState(
                                    () async {
                                      if (_phonenumber.length == 10) {
                                        var pnumber = int.parse(_phonenumber);
                                        phonenumber = _phonenumber;
                                        print(pnumber) ;
                                        ApiCaller().sendOtpToPhone(pnumber, 2);
                                        // print(name);
                                        // print(dob);
                                        firsttimechecker = 1;
                                        final SharedPreferences preferences = await SharedPreferences.getInstance();
                                        preferences.setString('driverPhoneNumber', _phonenumber);
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
                                    color: _phonenumber.length != 10
                                        ? const Color(0x80242A37)
                                        : const Color(0xff242A37),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  width: 305.w,
                                  height: 45.h,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'NEXT',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
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
                      ),
                    ),
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
