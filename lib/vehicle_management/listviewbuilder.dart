import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/global/globalvariables.dart';

class ListViewvm extends StatefulWidget {
  const ListViewvm({Key? key}) : super(key: key);

  @override
  _ListViewvmState createState() => _ListViewvmState();
}

class _ListViewvmState extends State<ListViewvm> {
  List<int> zeros = List.filled(ambulance_details.length, 0);
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => ListView.builder(
        itemCount: ambulance_details.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 15.h),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x809e9e9e),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                height: 88.h,
                width: 344.w,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
                  child: Row(
                    children: [
                      //Icon
                      CircleAvatar(
                        maxRadius: 27,
                        backgroundColor: Color(0xffFFD428),
                        child: Image.asset(
                          'icons/blacklist.png',
                          color: Colors.white,
                          fit: BoxFit.fill,
                        ),
                      ),

                      //Name and Number Plates
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Column(
                                mainAxisAlignment:  MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
                                    child: Text(
                                      ambulance_details[index]['model'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff242E42),
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.w,10.h, 10.w, 10.h),
                                    child: Text(
                                      ambulance_details[index]['car_no'],
                                      style: TextStyle(
                                        color: Color(0xffC8C7CC),
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width: 10,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (zeros[index] == 0) {
                                    zeros[index] = 1;
                                    zeros[number] = 0;
                                    number = index;
                                  } else {
                                    zeros[index] = 0;
                                  }
                                });
                              },
                              child: Container(
                                height: 30.h,
                                width: 30.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xffFF8900),
                                    width: 2.5,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: zeros[index] == 1
                                    ? Image.asset(
                                  'icons/tick.png',
                                  fit: BoxFit.fill,
                                )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Check Box

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
