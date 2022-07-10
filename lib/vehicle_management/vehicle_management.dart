// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';
import 'package:siren24/vehicle_management/addvehiclebutton.dart';
import 'package:siren24/vehicle_management/addvehiclepage.dart';
import 'package:siren24/vehicle_management/listviewbuilder.dart';
import 'package:flutter/material.dart';

class VehicleManagement extends StatefulWidget {
  const VehicleManagement({Key? key}) : super(key: key);
  static String id = 'VehicleManagement';

  @override
  State<VehicleManagement> createState() => _VehicleManagementState();
}

class _VehicleManagementState extends State<VehicleManagement> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:()=> SafeArea(
        child: Scaffold(
          drawer: MenuBar(),
          backgroundColor: Color(0xffF7F8FA),
          appBar: AppBar(
            toolbarHeight: 56.h,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFFFFD428), size: 24.sp),
            title: const Center(
              child: Text(
                'Vehicle Management',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff242A37),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              ListViewvm(),
              AddVehicleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
