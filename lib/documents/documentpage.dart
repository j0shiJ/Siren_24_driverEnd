import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:siren24/documents/imageselector.dart';
import 'package:siren24/global/globalvariables.dart';

import 'documentslist.dart';

class DocumentsUpload extends StatefulWidget {
  const DocumentsUpload({Key? key}) : super(key: key);
  static String id = 'DocumentsUpload';
  @override
  _DocumentsUploadState createState() => _DocumentsUploadState();
}

class _DocumentsUploadState extends State<DocumentsUpload> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF7F8FA),
            drawer: MenuBar(),
            appBar: AppBar(
              actions: [
                TextButton(
                  onPressed: () {
                    // if ( documents.length < 4 )
                      {
                        setState(() {
                          Navigator.pushNamed(
                              context, ImageSelector.id);
                        });
                      }
                  },
                  child:  Text(
                    'ADD',
                    style: TextStyle(
                      color: Color(0xFFFFD428),
                      fontSize: 17.sp,
                      fontFamily: 'SF UI Display',
                    ),
                  ),
                ),
              ],
              iconTheme: IconThemeData(color: Color(0xFFFFD428), size: 24.sp),
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              centerTitle: true,
              toolbarHeight: 56.h,
              title: Text(
                'Document Management',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff242A37),
                ),
              ),
            ),
            resizeToAvoidBottomInset: true,
            // body: Column(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
            //       child: Container(
            //         height: 280.h,
            //         width: 344.w,
            //         decoration: const BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.all(Radius.circular(10)),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            //               child: GestureDetector(
            //                 child: Container(
            //                   height: 210.h,
            //                   width: double.infinity,
            //                   child: Icon(
            //                       Icons.camera_alt,
            //                       size: 50.sp,
            //                     ),
            //
            //                   decoration: const BoxDecoration(
            //                     color: Color(0xffFFD428),
            //                     borderRadius: BorderRadius.vertical(
            //                       top: Radius.circular(10),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
            //               child: Text(
            //                 'Identification cards',
            //                 style: TextStyle(
            //                   fontSize: 20.sp,
            //                   color: Color(0xff242E42),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
            //       child: Container(
            //         height: 280.h,
            //         width: 344.w,
            //         decoration: const BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.all(Radius.circular(10)),
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            //               child: GestureDetector(
            //                 child: Container(
            //                   height: 210.h,
            //                   width: double.infinity,
            //                   child:Icon(
            //                       Icons.camera_alt,
            //                       size: 50.sp,
            //                     ),
            //                   decoration: const BoxDecoration(
            //                     color: Color(0xffFFD428),
            //                     borderRadius: BorderRadius.vertical(
            //                       top: Radius.circular(10),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
            //               child: Text(
            //                 'Driving Liciense',
            //                 style: TextStyle(
            //                   fontSize: 20.sp,
            //                   color: Color(0xff242E42),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // body: ListView.builder(
            //   itemCount: 4,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Padding(
            //         padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
            //         child: Container(
            //           height: 280.h,
            //           width: 344.w,
            //           decoration: const BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.all(Radius.circular(10)),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               GestureDetector(child: Text('Edit'),
            //               onTap: (){

            //               },),
            //               Padding(
            //                 padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            //                 child: GestureDetector(
            //                   child: Container(
            //                     height: 210.h,
            //                     width: double.infinity,
            //                     child: Image.file(documents[index]["image"]) ,
            //                     decoration: const BoxDecoration(
            //                       color: Colors.white,
            //                       borderRadius: BorderRadius.vertical(
            //                         top: Radius.circular(10),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),

            //               Container(
            //                 height: 60.h,

            //                 width: 375.w,
            //                 decoration: BoxDecoration(
            //                   color: Color(0xffFFD428),
            //                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            //                 ),
            //                 child: Padding(
            //                   padding:
            //                       EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
            //                   child: Center(
            //                     child: Text(
            //                       documentname[index],
            //                       style: TextStyle(
            //                         fontSize: 20.sp,
            //                         color: Color(0xff242E42),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ));
            //   },
            // ),
            body: SingleChildScrollView(
              child: Container(
                height: 1340.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                      child: Container(
                        height: 280.h,
                        width: 344.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 210.h,
                                  width: double.infinity,
                                  child: Image.network(userdata['aadhar_card'],) ,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60.h,
                              width: 375.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFD428),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Adhaar Card',
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Color(0xff242E42),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                      child: Container(
                        height: 280.h,
                        width: 344.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 210.h,
                                  width: double.infinity,
                                  child: Image.network(userdata['voter_id'],) ,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60.h,
                              width: 375.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFD428),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Voter ID Card",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Color(0xff242E42),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                      child: Container(
                        height: 280.h,
                        width: 344.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 210.h,
                                  width: double.infinity,
                                  child: Image.network(userdata['pan_card'],) ,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60.h,
                              width: 375.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFD428),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                  "Pan Card",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Color(0xff242E42),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                      child: Container(
                        height: 280.h,
                        width: 344.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                              child: GestureDetector(
                                child: Container(
                                  height: 210.h,
                                  width: double.infinity,
                                  child: Image.network(userdata['driving_licence'],) ,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 60.h,
                              width: 375.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffFFD428),
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 15.h),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Driving License",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Color(0xff242E42),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
