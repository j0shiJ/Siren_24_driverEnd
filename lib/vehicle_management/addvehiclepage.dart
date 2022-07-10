// ignore_for_file: prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:siren24/ForAPI/apicalling.dart';
import 'package:siren24/GoogleMaps/homeOffline.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:siren24/documents/imageselector.dart';
import 'package:siren24/global/globalvariables.dart';
import 'package:siren24/vehicle_management/vehicle_management.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);
  static String id = 'add_vehicle_page';

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  String? ambulanceBrand;
  List<String> brand = [
    'Bajaj',
    'Ford',
    'Force',
    'Mahindra',
    'Maruti',
    'Suzuki',
    'Tata',
    'Tempo',
    'Traveller',
    'Others',
  ];

  String? ambulanceType;
  List<String> type = [
    'ACLS',
    'AIR AMBULANCE',
    'ALS',
    'ALS+',
    'BIKE AMBULANCE',
    'BLS',
    'PATIENT TRANSPORT',
  ];

  String? ambulanceModel;
  List<String> model = [
    'Suzuki Omni',
    'Suzuki Eeco',
    'Winger',
    'Bolero',
    'Supro',
    'Hector',
    'Innova',
    'Camry',
  ];

  List<dynamic> addOns = [
    {
      "display": "Paramedic",
      "value": "Paramedic",
    },
    {
      "display": "Stretcher",
      "value": "Stretcher",
    },
    {
      "display": "Oxygen",
      "value": "Oxygen",
    },
    {
      "display": "Ventilator",
      "value": "Ventilator",
    },
    {
      "display": "Patient Monitoring",
      "value": "Patient Monitoring",
    },
    {
      "display": "Equipment and Defibrillator",
      "value": "Equipment and Defibrillator",
    },
  ];

  late String no_amb ;
  late String type_amb ;
  late String brand_amb ;
  late String model_amb ;
  late List addons_amb ;

  final List<String> _selectedItems = [];
  List? _myActivities;
  late String _myActivitiesResult;



  TextEditingController lisencePlate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          drawer: MenuBar(),
          backgroundColor: Color(0xFFF7F8FA),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFFFFD428)),
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              'Add a new Ambulance',
              style: TextStyle(
                fontFamily: 'SF UI Display',
                fontSize: 21.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBEC2CE),
              ),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h, left: 20.w),
                child: Text(
                  'AMBULANCE BRAND',
                  style: TextStyle(
                    color: Color(0xFFBEC2CE),
                    fontSize: 18.sp,
                    fontFamily: 'SF UI Display',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 20.w),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Select your Ambulance Brand'),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: SizedBox(),
                    value: ambulanceBrand,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFBEC2CE),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (newValue) async {
                      setState(() {
                        ambulanceBrand = newValue;
                        brand_amb  = newValue! ;
                      });
                    },
                    items: brand.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h, left: 20.w),
                child: Text(
                  'MODEL',
                  style: TextStyle(
                    color: Color(0xFFBEC2CE),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF UI Display',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 20.w),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Select your Ambulance Model'),
                    isExpanded: true,
                    underline: SizedBox(),
                    value: ambulanceModel,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFBEC2CE),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (newValue) {
                      setState(() {
                        ambulanceModel = newValue;
                        model_amb = newValue! ;
                      });
                    },
                    items: model.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h, left: 20.w),
                child: Text(
                  'TYPE',
                  style: TextStyle(
                    color: Color(0xFFBEC2CE),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF UI Display',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 20.w),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: DropdownButton<String>(
                    hint: Text('Select your Ambulance Type'),
                    isExpanded: true,
                    underline: SizedBox(),
                    value: ambulanceType,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFBEC2CE),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (newValue) {
                      setState(() {
                        ambulanceType = newValue;
                        type_amb = newValue! ;
                      });
                    },
                    items: type.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h, left: 20.w),
                child: Text(
                  'LICENSE PALTE',
                  style: TextStyle(
                    color: Color(0xFFBEC2CE),
                    fontSize: 18.sp,
                    fontFamily: 'SF UI Display',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 45.sp,
                  child: TextFormField(
                    onChanged: (value){
                      setState(() {
                        no_amb = value ;
                      });
                    },
                    controller: lisencePlate,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your Lisence Number',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                child: MultiSelectFormField(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  chipBackGroundColor: Color(0xFFFFD428),
                  checkBoxActiveColor: Color(0xFFFFD428),
                  checkBoxCheckColor: Colors.black,
                  dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text(
                    'ADD ONs',
                    style: TextStyle(
                      color: Color(0xFFBEC2CE),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF UI Display',
                    ),
                  ),
                  dataSource: [
                    {
                      "display": "Paramedic",
                      "value": "Paramedic",
                    },
                    {
                      "display": "Stretcher",
                      "value": "Stretcher",
                    },
                    {
                      "display": "Oxygen",
                      "value": "Oxygen",
                    },
                    {
                      "display": "Ventilator",
                      "value": "Ventilator",
                    },
                    {
                      "display": "Patient Monitoring",
                      "value": "Patient Monitoring",
                    },
                    {
                      "display": "Equipment and Defibrillator",
                      "value": "Equipment and Defibrillator",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'ADD',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text('Select ADD ONs'),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      // print(value) ;
                      // _myActivities = value;
                      addons_amb = value  ;
                      print(addons_amb) ;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 36.w,
                  right: 36.w,
                  top: 36.h,
                  bottom: 20.h,
                ),
                child: GestureDetector(
                  onTap: () async {
                    print("a") ;
                    String x = await ApiCaller().addambulance(no_amb, type_amb, brand_amb, model_amb, addons_amb) ;
                    print("b") ;
                    ambulance_details = await ApiCaller().get_ambulance() ;
                    print("c");
                    setState(
                          () async{
                        //     print(x) ;
                        // Navigator.pushReplacementNamed(
                        //   context,
                        //   VehicleManagement.id,
                        // );
                            ambulance_details = await ApiCaller().get_ambulance();
                            if (firsttimechecker == 0) {

                              Timer(Duration(seconds: 3), () {
                                Navigator.pushNamed(
                                  context,
                                  ImageSelector.id,
                                );
                              });

                            } else {
                              Navigator.pushNamed(
                                context,
                                VehicleManagement.id,
                              );
                            }
                      },
                    );
                  },
                  child: Container(
                    height: 54.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFD428),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Add Ambulance',
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
    );
  }
}
