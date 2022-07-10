import 'package:flutter/material.dart';

class Referral_Code extends StatefulWidget {
  const Referral_Code({
    Key? key,
  }) : super(key: key);

  @override
  State<Referral_Code> createState() => _Referral_CodeState();
}

class _Referral_CodeState extends State<Referral_Code> {
  String referralCode = 'Enter referral code';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Referral Code'),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 15,
                height: 1.25,
              ),
              onChanged: (value) {
                setState(
                  () {
                    referralCode = value;
                  },
                );
              },
              cursorColor: const Color(0xffFFD428),
              decoration: InputDecoration(
                // contentPadding: EdgeInsets.only(left: 30,right: 20, top: 20, bottom: 20),
                hintText: referralCode,
                hintStyle: const TextStyle(
                  // fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xffBEC2CE),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xffEFEFF4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color(0xffEFEFF4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Apply'),
        ),
      ],
    );
  }
}