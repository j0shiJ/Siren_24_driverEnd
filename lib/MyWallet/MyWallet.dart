// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:siren24/MyWallet/PaymentMethod.dart';
import 'package:siren24/global/globalvariables.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);
  static String id = 'my_wallet';

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFD428),
              ),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height*0.42,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      'My Wallet',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD428),
                        border: Border.all(
                          color: Color(0xFF242A37),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: MediaQuery.of(context).size.aspectRatio * 540,
                      height: MediaQuery.of(context).size.aspectRatio * 60,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFF242A37),
                            ),
                            child: Center(
                              child: Text(
                                'Cash',
                                style: TextStyle(
                                  color: Color(0xFFFFD428),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            child: Center(
                              child: Text(
                                'Discount',
                                style: TextStyle(
                                  color: Color(0xFF242A37),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      '\$325.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'TOTAL EARN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.176),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context,
                        PaymentMethod.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFD428),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'UIAssets/money-2.png',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Payment method',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'SF UI Display',
                              letterSpacing: 1,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.85, 0.036),
              child: Text(
                'PAYMENT HISTORY',
                style: TextStyle(
                  color: Color(0xFFBEC2CE),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1.1),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    border: Border.all(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xFFF2F2F2),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ListView.builder(
                      itemCount: history_data.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Image.asset('UIAssets/dp.png'),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Elva Barnett',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '#740136',
                                            style: TextStyle(
                                              color: Color(0xFFBEC2CE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: Text(
                                      '₹'+ history_data[index]["order_amount"].toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 18),
                              height: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        );
                      },

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}