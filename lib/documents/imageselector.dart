import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/GoogleMaps/homeOffline.dart';
import 'package:siren24/documents/documentpage.dart';
import 'package:siren24/documents/documentslist.dart';
import 'package:siren24/global/globalvariables.dart';


class ImageSelector extends StatefulWidget {
  @override
  _ImageSelectorState createState() => _ImageSelectorState();
  static String id = 'ImageSelector';
}

class _ImageSelectorState extends State<ImageSelector> {
  File? _image;
  String? filename ;
  String? extension ;
  Uint8List? imageinbytes ;
  Future uploadImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source,imageQuality: source == ImageSource.camera ? 40 : 70,);
    File file = File(image!.path);
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final imagebytes = await  file.readAsBytes();
    setState(() {
      print(kb);
      filename = path.basename(file.path)!.split("/").last ;
      _image = (file);
      extension = filename!.split(".").last ;
      uploadcounter = 1;
      imageinbytes = imagebytes ;
      // print(imagebytes) ;
    });
  }

  String? documentType ;
  // String? nameofdoc ;
  int uploadcounter = 0;
  List<String> document = [
    'Adhaar Card',
    'Voter ID Card',
    'Driving License',
    'Pan Card',
  ];

  SnackBar registrationdone = SnackBar(content: Text('Uploading Document.'),
  duration: Duration(seconds: 7),);

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
                  appBar: AppBar(
                    iconTheme:
                        IconThemeData(color: Color(0xFFFFD428), size: 24.sp),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    centerTitle: true,
                    toolbarHeight: 56.h,
                    title: Text(
                      'Document Upload',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff242A37),
                      ),
                    ),
                  ),
                  resizeToAvoidBottomInset: true,
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                        child: Container(
                          height: 290.h,
                          width: 344.w,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
                                child: GestureDetector(
                                  child: Container(
                                    height: 210.h,
                                    width: double.infinity,
                                    child: _image == null
                                        ? Center(
                                            child: Text(
                                              'Upload Document',
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                          )
                                        : Image.file(_image!),
                                    decoration: BoxDecoration(
                                      color: _image == null
                                          ? Color(0xffFFD428)
                                          : Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      ),
                                    ),
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
                                    hint: Text('Select document type'),
                                    isExpanded: true,
                                    borderRadius: BorderRadius.circular(10),
                                    underline: SizedBox(),
                                    value: documentType,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Color(0xFFBEC2CE),
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    onChanged: (newValue) async {
                                      setState(() {
                                        String temp = newValue.toString() ;
                                        documentType = temp;
                                        print(documentType);
                                        // document.remove(temp) ;
                                        // print(temp);
                                      });
                                    },
                                    items: document
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0),
                              //   child: Container(
                              //     height: 345.h,
                              //     width: 45.w,
                              //     child: DropdownButton<String>(
                              //       value: documentType,
                              //       style: TextStyle(
                              //         fontSize: 17.sp,
                              //         height: 1.5,
                              //       ),
                              //       iconEnabledColor: Colors.black,
                              //       items: document
                              //           .map<DropdownMenuItem<String>>(
                              //               (String value) {
                              //         return DropdownMenuItem<String>(
                              //           value: value,
                              //           child: Text(
                              //             value,
                              //             style: TextStyle(
                              //               fontSize: 17.sp,
                              //               height: 1.5,
                              //             ),
                              //           ),
                              //         );
                              //       }).toList(),
                              //       hint: const Text(
                              //         "Enter Document Type",
                              //         style: TextStyle(
                              //           // fontSize: 20,
                              //           fontWeight: FontWeight.normal,
                              //           color: Color(0xffBEC2CE),
                              //         ),
                              //       ),
                              //       onChanged: (String value){
                              //         setState(() {
                              //           documentType = value ;
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),

                      //Upload Button
                      uploadcounter == 0
                          ? Padding(
                              padding:
                                  EdgeInsets.fromLTRB(15.w, 17.h, 15.w, 17.h),
                              child: Container(
                                height: 45.h,
                                width: 345.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Gallery
                                    GestureDetector(
                                      onTap: () =>
                                          uploadImage(ImageSource.gallery,),
                                      child: Container(
                                        height: 45.h,
                                        width: 165.w,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Color(0xffFFD428)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Gallery',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                            Icon(
                                              Icons.image_outlined,
                                              size: 25.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //Camera
                                    GestureDetector(
                                      onTap: () =>
                                          uploadImage(ImageSource.camera),
                                      child: Container(
                                        height: 45.h,
                                        width: 165.w,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Color(0xffFFD428)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Camera',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                              ),
                                            ),
                                            Icon(
                                              Icons.camera_alt,
                                              size: 25.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.fromLTRB(15.w, 17.h, 15.w, 17.h),
                              child: GestureDetector(
                                onTap: () async {
                                  if (documentType != " ") {
                                    mapfordata.addAll({
                                      "image":
                                          (_image != null ? _image : null)!,
                                      "type": documentType
                                    });
                                    documents.add(mapfordata);
                                    mapfordata = {};
                                    print(filename!) ;
                                    print(_image!.path) ;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(registrationdone) ;
                                    stringfordata = await ApiCaller().fileUploader(filename!,_image!,extension!) ;
                                    // print(x["url"]) ;
                                    if ( documentType == 'Adhaar Card')
                                      {
                                        documents[0]["image"] = _image ;
                                        print(stringfordata['url'],);
                                        String x = await ApiCaller().editProfile(
                                          userdata['name'],
                                          userdata['dob'],
                                          userdata['gender'],
                                          userdata['profile_img'],
                                          stringfordata['url'],
                                          userdata['voter_id'],
                                          userdata['pan_card'],
                                          userdata['driving_licence'],
                                          20,
                                        );
                                        userdata = await ApiCaller().user_profile();
                                      }
                                    else if(documentType == 'Voter ID Card')
                                      {
                                        documents[1]["image"] = _image ;
                                        print(stringfordata['url'],);
                                        String x = await ApiCaller().editProfile(
                                          userdata['name'],
                                          userdata['dob'],
                                          userdata['gender'],
                                          userdata['profile_img'],
                                          userdata['aadhar_card'],
                                          stringfordata['url'],
                                          userdata['pan_card'],
                                          userdata['driving_licence'],
                                          20,
                                        );
                                        userdata = await ApiCaller().user_profile();
                                      }
                                    else if(documentType == 'Pan Card')
                                      {
                                        documents[2]["image"] = _image ;
                                        print(stringfordata['url'],);
                                        // Timer(Duration(minutes: 3), (){
                                        //   ApiCaller().editProfile(
                                        //     userdata['name'],
                                        //     userdata['dob'],
                                        //     userdata['gender'],
                                        //     userdata['profile_img'],
                                        //     userdata['aadhar_card'],
                                        //     userdata['voter_id'],
                                        //     stringfordata['url'],
                                        //     userdata['driving_licence'],
                                        //     20,
                                        //   );
                                        //   print("DONEEEEEEe") ;
                                        // });
                                        String x = await ApiCaller().editProfile(
                                          userdata['name'],
                                          userdata['dob'],
                                          userdata['gender'],
                                          userdata['profile_img'],
                                          userdata['aadhar_card'],
                                          userdata['voter_id'],
                                          stringfordata['url'],
                                          userdata['driving_licence'],
                                          20,
                                        );
                                        userdata = await ApiCaller().user_profile();
                                      }
                                    else
                                      {
                                        documents[3]["image"] = _image ;
                                        print(stringfordata['url'],);
                                        String x = await ApiCaller().editProfile(
                                          userdata['name'],
                                          userdata['dob'],
                                          userdata['gender'],
                                          userdata['profile_img'],
                                          userdata['aadhar_card'],
                                          userdata['voter_id'],
                                          userdata['pan_card'],
                                          stringfordata['url'],
                                          20,
                                        );
                                        userdata = await ApiCaller().user_profile();
                                      }
                                    // history_data = await ApiCaller().historydata() ;
                                    ambulance_details = await ApiCaller().get_ambulance();

                                    if (firsttimechecker == 0) {

                                      Timer(Duration(seconds: 3), () {
                                        Navigator.pushNamed(
                                          context,
                                          HomeOffline.id,
                                        );
                                      });

                                      firsttimechecker = 1;
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        DocumentsUpload.id,
                                      );
                                    }
                                    // Navigator.pushReplacementNamed(
                                    //     context, DocumentsUpload.id);
                                  } else {
                                    const errorSnackbar = SnackBar(
                                      content: Text('ENTER THE DOCUMENT NAME'),
                                      duration: Duration(seconds: 3),
                                    );
                                    // Scaffold.of(context).showSnackBar(snackBar);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(errorSnackbar);
                                  }
                                },
                                child: Container(
                                  height: 45.h,
                                  width: 345.w,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: documentType == " "
                                          ? const Color(0x80FFD428)
                                          : const Color(0xffFFD428)),
                                  child: Center(
                                    child: Text(
                                      'Upload',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
