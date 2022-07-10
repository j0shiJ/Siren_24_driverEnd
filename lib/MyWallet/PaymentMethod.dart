// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:siren24/Menu_Bar.dart/MenuBar.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);
  static String id = 'payment_method';

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Payment Method',
          style: TextStyle(
            fontFamily: 'SF UI Display',
            fontSize: MediaQuery.of(context).size.aspectRatio * 36,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Material(
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 5,
                      top: 7,
                      bottom: 7,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.136,
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFD428),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'UIAssets/card.png',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Add a new card',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.aspectRatio *
                                        39,
                                fontFamily: 'SF UI Display',
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.grey[400],
                            size: MediaQuery.of(context).size.aspectRatio * 58,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Align(
            alignment: Alignment(-0.78, 0),
            child: Text(
              'CREDIT CARDS',
              style: TextStyle(
                fontFamily: 'SF UI Display',
                fontSize: MediaQuery.of(context).size.aspectRatio * 30,
                color: Color(0xFFBEC2CE),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Container(
              height: 375,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Color(0xFFE0E0E0),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F2F6),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/cc-visa.png',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '**** **** **** 3765',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                32,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'VISA',
                                          style: TextStyle(
                                            color: Color(0xFFBEC2CE),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                28,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F2F6),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/cc-paypal.png',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'pfeffer_ellen@balistreri.net',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                32,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Paypal',
                                          style: TextStyle(
                                            color: Color(0xFFBEC2CE),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                28,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.025,
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF1F2F6),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'UIAssets/cc-mastercard.png',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '**** **** **** 8562',
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                32,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          'Master Card',
                                          style: TextStyle(
                                            color: Color(0xFFBEC2CE),
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .aspectRatio *
                                                28,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
