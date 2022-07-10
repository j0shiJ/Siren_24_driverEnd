
import 'package:flutter/material.dart';
import 'package:siren24/vehicle_management/addvehiclepage.dart';

class AddVehicleButton extends StatefulWidget {
  const AddVehicleButton({Key? key}) : super(key: key);
  static String id = 'addvehiclebutton' ;
  @override
  _AddVehicleButtonState createState() => _AddVehicleButtonState();
}

class _AddVehicleButtonState extends State<AddVehicleButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height*0.05,
      left: (MediaQuery.of(context).size.width-MediaQuery.of(context).size.height*0.08)*0.5,
      child: GestureDetector(
        onTap: (){
          print('111');
          setState(() {
            Navigator.pushNamed(context, AddVehiclePage.id) ;
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.08,
          width: MediaQuery.of(context).size.height*0.08,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color(0x809e9e9e),
                blurRadius: 15.0,
                spreadRadius: 5,
              ),
            ],
            color: Color(0xffFFD428),
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.5,
              color: Colors.white,
            ),
          ),
          child: Image.asset('icons/plus1.png',
            color: Color(0xff242A37),
            scale: 1.2,),
        ),
      ),
    );
  }
}
