// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({Key? key}) : super(key: key);
  static String id = 'HistoryDetails';

  @override
  _HistoryDetailsState createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Scaffold(
        backgroundColor: Color(0xFFFFD428),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: ListView(
            children: [
              Container(
                height: 665.h,
                width: 348.h,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(7),
                          child: Row(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    'UIAssets/dp.png',
                                    scale: 1.1,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jeremiah Curtis',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          FacilityTags(),
                                          FacilityTags(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Earned',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Earned',
                                      style: TextStyle(
                                        color: Color(0xFFBEC2CE),
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xFFEFEFF4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PICKUP',
                              style: TextStyle(
                                color: Color(0xFFBEC2CE),
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '7958 Swift Village',
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xFFEFEFF4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DROP OFF',
                              style: TextStyle(
                                color: Color(0xFFBEC2CE),
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '105 William St, Chicago, US',
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xFFEFEFF4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NOTED',
                              style: TextStyle(
                                color: Color(0xFFBEC2CE),
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipisc elit. Nullam ac vestibulum erat.',
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xFFEFEFF4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TRIP FARE',
                              style: TextStyle(
                                color: Color(0xFFBEC2CE),
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Apple Pay',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                Text(
                                  '\$15.00',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                Text(
                                  '\$10.00',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Paid Amount',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                                Text(
                                  '\$25.00',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color(0xFFEFEFF4),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 7,
                          ),
                          child: Container(
                            width: 250,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFF242A37),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 7,
                          ),
                          child: Container(
                            width: 250,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFD428),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'DROP OFF',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}

class FacilityTags extends StatelessWidget {
  const FacilityTags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 50.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFD428),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              'Doctor',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
