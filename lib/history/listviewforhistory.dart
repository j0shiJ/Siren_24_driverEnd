import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/bookingdetails/bookingdetailsbefore.dart';
import 'package:siren24/global/globalvariables.dart';

class ListViewHistory extends StatefulWidget {
  const ListViewHistory({Key? key}) : super(key: key);

  @override
  _ListViewHistoryState createState() => _ListViewHistoryState();
}

class _ListViewHistoryState extends State<ListViewHistory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Container(
        height: 620.h,
        color: const Color(0xffF7F8FA),
        child: ListView.builder(
          itemCount: history_data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 10.h),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.pushNamed(context, BookingDetailsBefore.id);
                  });
                },
                child: Container(
                  height: 217.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x809e9e9e),
                        blurRadius: 15.0,
                        // spreadRadius: 5,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Row 1
                      Container(
                        height: 68.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                          color: Color(0xffF7F7F7),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.w, 12.h, 7.5.w, 12.h),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                height: 44.h,
                                width: 44.w,
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Column(
                            //       children: [
                            //         Padding(
                            //           padding: EdgeInsets.fromLTRB(7.5.w, 15.h, 15.w, 15.h),
                            //           child: Text(
                            //             'Steve Bowen',
                            //             style: TextStyle(
                            //               color: Color(0xff242E42),
                            //               fontSize: 17.sp,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.end,
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                            //       child: Text(
                            //         '₹'+ history_data[index]["order_amount"].toString(),
                            //         style: TextStyle(
                            //           color: Color(0xff242E42),
                            //           fontSize: 25,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: EdgeInsets.fromLTRB(10.w, 0, 0, 8.h),
                            //       child: Text(
                            //         history_data[index]["order_distance"].toString()+' km',
                            //         style: TextStyle(
                            //           fontSize: 20,
                            //           color: Color(0xffBEC2CE),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Container(
                              width: 250.w,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 120.w,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.w, 14.h, 10.w, 10.h),
                                          child: Text(
                                            'Steve Bowen',
                                            style: TextStyle(
                                              color: Color(0xff242E42),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.w, 14.h, 5.w, 0.h),
                                          child: Text(
                                            '₹' + '25.00',
                                            style: TextStyle(
                                              color: Color(0xff242E42),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0.w, 0.h, 5.w, 0.h),
                                          child: Text(
                                            '2.2 km',
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xffBEC2CE),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color(0xffEFEFF4),
                        height: 1,
                      ),

                      //Row 2
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 19.h, 0.w, 5.h),
                        child: Text(
                          'PICK UP',
                          style: TextStyle(
                            color: Color(0xffBEC2CE),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0.h, 0, 13.h),
                        child: Text(
                          '7958 Swifit Village',
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                        child: Container(
                          color: const Color(0xffEFEFF4),
                          width: 344.w,
                          height: 1,
                        ),
                      ),

                      //Row 3
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 19.h, 0.w, 5.h),
                        child: Text(
                          'DROP OFF',
                          style: TextStyle(
                            color: Color(0xffBEC2CE),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.w, 0.h, 0, 13.h),
                        child: Text(
                          '105 William St, Chicago, US',
                          style: TextStyle(
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
                      //   child: Container(
                      //     color: const Color(0xffEFEFF4),
                      //     width: 344.w,
                      //     height: 1,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
