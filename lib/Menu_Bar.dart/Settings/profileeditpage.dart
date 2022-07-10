// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/GoogleMaps/HomeOffline.dart';
import 'package:siren24/documents/documentpage.dart';
import 'package:siren24/documents/imageselector.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:date_field/date_field.dart';
import 'package:siren24/vehicle_management/addvehiclepage.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);
  static String id = 'profileeditpage';

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String name = userdata["name"] ?? " ";
  String dob = userdata["dob"] ?? "1995-02-22T00:00:00.000Z";
  String gender = userdata["gender"] ?? " ";
  // DateTime? sel = DateTime.tryParse("1995-02-22T00:00:00.000Z");
  DateTime? sel = DateTime.now();
  String? driverGenderSelect;
  List<String> driverGender = [
    'Female',
    'Male',
  ];

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
            appBar: AppBar(
              iconTheme:
              IconThemeData(color: Color(0xFFFFD428), size: 24.sp),
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: 56.h,
              title: Text(
                'Profile Edit',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff242A37),
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffF7F8FA),
            // backgroundColor: Colors.red,
            body: Padding(
              padding:
              EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 10.h),
              child: Container(
                height: 600.h,
                width: 440.h,
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        20.w,
                        15.h,
                        20.w,
                        15.h,
                      ),
                      child: Container(
                        height: 165.h,
                        width: 450.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.5,
                                ),
                                onChanged: (value) {
                                  setState(
                                        () {
                                      name = value;
                                    },
                                  );
                                },
                                cursorColor: const Color(0xffFFD428),
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
                                  hintText: name,
                                  hintStyle: const TextStyle(
                                    // fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xffBEC2CE),
                                  ),
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                      child: Container(
                        height: 145.h,
                        width: 450.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                              EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 0),
                              child: Container(
                                width: 345.w,
                                height: 45.h,
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(10),
                                  hint: Text('Select your Gender'),
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  value: driverGenderSelect,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFFBEC2CE),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  onChanged: (newValue) {
                                    setState(
                                          () {
                                        driverGenderSelect = newValue;
                                        gender = newValue! ;
                                      },
                                    );
                                  },
                                  items: driverGender.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(5),
                            //   child: TextField(
                            //     style: TextStyle(
                            //       fontSize: 20,
                            //       height: 1.5,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //     onChanged: (value) {
                            //       setState(
                            //         () {
                            //           gender = value;
                            //         },
                            //       );
                            //     },
                            //     cursorColor: const Color(0xffFFD428),
                            //     decoration: InputDecoration(
                            //       // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
                            //       hintText: gender,
                            //       hintStyle: const TextStyle(
                            //         // fontSize: 20,
                            //         fontWeight: FontWeight.normal,
                            //         color: Color(0xffBEC2CE),
                            //       ),
                            //       enabledBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: const BorderSide(
                            //           width: 2,
                            //           color: Color(0xffEFEFF4),
                            //         ),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide: const BorderSide(
                            //           width: 2,
                            //           color: Color(0xffEFEFF4),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                      child: Container(
                        height: 175.h,
                        width: 450.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Date of Birth',
                                style: TextStyle(
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: DateTimeField(
                                mode: DateTimeFieldPickerMode.date,
                                decoration: InputDecoration(
                                  // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
                                  hintText: dob,
                                  hintStyle: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xffBEC2CE),
                                  ),
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
                                lastDate: DateTime.now(),
                                onDateSelected: (value) {
                                  setState(
                                        () {
                                      dob = value.toString();
                                      print(dob);
                                    },
                                  );

                                  // print(dob) ;
                                },
                                selectedDate: DateTime.tryParse(dob),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.w, 5.h),
                      child: GestureDetector(
                        onTap: () async {
                          print(name + dob + gender);
                          String adhar = userdata['aadhar_card'] == "Update your aadhar card" ? "https://cdn-icons-png.flaticon.com/512/21/21104.png" : userdata['aadhar_card'] ;
                          String voter = userdata['voter_id'] == "Update your voter id" ? "https://cdn-icons-png.flaticon.com/512/21/21104.png" : userdata['voter_id'] ;
                          String pan = userdata['pan_card'] == "Update your pan card" ? "https://cdn-icons-png.flaticon.com/512/21/21104.png" : userdata['pan_card'] ;
                          String driving = userdata['driving_licence'] == "Update your driving licence" ? "https://cdn-icons-png.flaticon.com/512/21/21104.png" : userdata['driving_licence'] ;
                          String x = await ApiCaller().editProfile(
                            name,
                            dob,
                            gender,
                            userdata['profile_img'],
                            adhar,
                            voter,
                            pan,
                            driving,
                            20,
                          );
                          userdata = await ApiCaller().user_profile();
                          setState(
                                () {
                              print(" result" + x);
                              print(userdata);
                              if (firsttimechecker == 0) {

                                  Navigator.pushNamed(
                                    context,
                                    AddVehiclePage.id,
                                  );


                                // firsttimechecker = 1;
                              } else {
                                Navigator.pushNamed(
                                  context,
                                  DocumentsUpload.id,
                                );
                              }

                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff242A37),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 305.w,
                          height: 50.h,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'SUBMIT',
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
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}