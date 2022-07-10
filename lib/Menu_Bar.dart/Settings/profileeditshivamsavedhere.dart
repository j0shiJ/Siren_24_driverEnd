// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:siren24/ForAPI/apicalling.dart';
// import 'package:siren24/Menu_Bar.dart/Settings/Profile.dart';
// import 'package:siren24/global/globalvariables.dart';
// import 'package:date_field/date_field.dart';

// class ProfileEditPage extends StatefulWidget {
//   const ProfileEditPage({Key? key}) : super(key: key);
//   static String id = 'profileeditpage';

//   @override
//   _ProfileEditPageState createState() => _ProfileEditPageState();
// }

// class _ProfileEditPageState extends State<ProfileEditPage> {
//   String name = userdata["name"] ?? " ";
//   String dob = userdata["dob"] ?? "1995-02-22T00:00:00.000Z";
//   String gender = userdata["gender"] ?? " ";
//   DateTime? sel = DateTime.tryParse("1995-02-22T00:00:00.000Z");
//   // String profileimg = userdata["profile_img"] ;
//   // int age = userdata["age"] ==  ? " " : userdata["age"];

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: () => GestureDetector(
//         onTap: () {
//           FocusScopeNode currentFocus = FocusScope.of(context);

//           if (!currentFocus.hasPrimaryFocus) {
//             currentFocus.unfocus();
//           }
//         },
//         child: SafeArea(
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: Color(0xffFFD428),
//             // backgroundColor: Colors.red,
//             body: Center(
//               child: Padding(
//                 padding:
//                     EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 10.h),
//                 child: Container(
//                   height: 650.h,
//                   width: 450.h,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 15.0,
//                         ),
//                       ]),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(
//                           20.w,
//                           15.h,
//                           20.w,
//                           15.h,
//                         ),
//                         child: Container(
//                           height: 160,
//                           width: 450,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(
//                                   'Name',
//                                   style: TextStyle(
//                                     fontSize: 35,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: TextField(
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       name = value;
//                                     });
//                                   },
//                                   cursorColor: const Color(0xffFFD428),
//                                   decoration: InputDecoration(
//                                     // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
//                                     hintText: name,
//                                     hintStyle: const TextStyle(
//                                       // fontSize: 20,
//                                       fontWeight: FontWeight.normal,
//                                       color: Color(0xffBEC2CE),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
//                         child: Container(
//                           height: 160,
//                           width: 450,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(
//                                   'Gender',
//                                   style: TextStyle(
//                                     fontSize: 35,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: TextField(
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     height: 1.5,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       gender = value;
//                                     });
//                                   },
//                                   cursorColor: const Color(0xffFFD428),
//                                   decoration: InputDecoration(
//                                     // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
//                                     hintText: gender,
//                                     hintStyle: const TextStyle(
//                                       // fontSize: 20,
//                                       fontWeight: FontWeight.normal,
//                                       color: Color(0xffBEC2CE),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
//                         child: Container(
//                           height: 160,
//                           width: 450,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Text(
//                                   'Date of Birth',
//                                   style: TextStyle(
//                                     fontSize: 35,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: DateTimeField(
//                                   mode: DateTimeFieldPickerMode.date,
//                                   decoration: InputDecoration(
//                                     // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
//                                     hintText: dob,
//                                     hintStyle: const TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.normal,
//                                       color: Color(0xffBEC2CE),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                       borderSide: const BorderSide(
//                                         width: 2,
//                                         color: Color(0xffEFEFF4),
//                                       ),
//                                     ),
//                                   ),
//                                   lastDate: DateTime.now(),
//                                   onDateSelected: (value) {
//                                     setState(() {
//                                       dob = value.toString();
//                                       print(dob);
//                                     });

//                                     // print(dob) ;
//                                   },
//                                   selectedDate: DateTime.tryParse(dob),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 20.h),
//                         child: GestureDetector(
//                           onTap: () async {
//                             print(name + dob + gender);
//                             String x = await ApiCaller().editProfile(
//                                 name,
//                                 dob,
//                                 gender,
//                                 "https://cdn-icons-png.flaticon.com/512/21/21104.png",
//                                 20);
//                             userdata = await ApiCaller().user_profile();
//                             setState(() {
//                               print(" result" + x);
//                               print(userdata);
//                               Navigator.pushReplacementNamed(
//                                   context, Profile.id);
//                             });
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color(0xff242A37),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                             ),
//                             width: 305.w,
//                             height: 45.h,
//                             child: Center(
//                               child: Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Text(
//                                   'SIGN UP',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17.sp,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       designSize: const Size(375, 812),
//     );
//   }
// }
