import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/history/listviewforhistory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);
  static String id = 'History';

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
            'History',
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xff242A37),
            ),
          ),
        ),
        body: Container(
          color: Color(0xffF7F8FA),
          child: Center(
            child: Text("No History"),
          ),
          // child: Column(
          //   children: [
          //     // Container(
          //     //   color: Colors.white,
          //     //   height: MediaQuery.of(context).size.height * 0.13,
          //     // ),
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(15.w, 16.h, 15.w, 15.h),
          //       child: Row(
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.fromLTRB(0.w, 0.h, 7.5.w, 0.h),
          //             child: Container(
          //               width: 165.w,
          //               height: 73.h,
          //               decoration: const BoxDecoration(
          //                 borderRadius: BorderRadius.all(Radius.circular(10)),
          //                 color: Color(0xffFFD428),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Color(0x809e9e9e),
          //                     blurRadius: 15.0,
          //                     // spreadRadius: 5,
          //                   ),
          //                 ],
          //               ),
          //               child: Center(
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: EdgeInsets.fromLTRB(17.w, 25.h, 8.5.w, 25.h),
          //                       child: Image.asset(
          //                         'images/icon.png',
          //                         scale: 0.7.sp,
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 8.5.w),
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                         children: [
          //                           Text(
          //                             'Total Jobs',
          //                             style: TextStyle(
          //                               fontSize: 13.sp,
          //                               color: Color(0x80242A37),
          //                             ),
          //                           ),
          //                           Text(
          //                             history_data.length.toString(),
          //                             style: TextStyle(
          //                               fontSize: 25.sp,
          //                               color: Color(0xff242A37),
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.fromLTRB(0.w, 0.h, 7.5.w, 0.h),
          //             child: Container(
          //               width: 165.w,
          //               height: 73.h,
          //               decoration: const BoxDecoration(
          //                 borderRadius: BorderRadius.all(Radius.circular(10)),
          //                 color: Color(0xffFF8900),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Color(0x809e9e9e),
          //                     blurRadius: 15.0,
          //                     // spreadRadius: 5,
          //                   ),
          //                 ],
          //               ),
          //               child: Center(
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: EdgeInsets.fromLTRB(17.w, 25.h, 8.5.w, 25.h),
          //                       child: Image.asset(
          //                         'images/money-1.png',
          //                         scale: 0.7.sp,
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding: EdgeInsets.only(left: 8.5.w),
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                         children: [
          //                           Text(
          //                             'Earned',
          //                             style: TextStyle(
          //                               fontSize: 13.sp,
          //                               color: Color(0x80242A37),
          //                             ),
          //                           ),
          //                           Text(
          //                             ' ₹325.00 ',
          //                             style: TextStyle(
          //                               fontSize: 25.sp,
          //                               color: Color(0xff242A37),
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(0, 0, 0, 10.h),
          //       child: Container(
          //         height: 600.h,
          //         child: ListViewHistory(),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
