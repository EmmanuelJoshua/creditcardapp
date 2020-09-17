import 'package:flutter/material.dart';

class MakePayment extends StatefulWidget {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Make successful Payments',
            style: TextStyle(
                fontFamily: 'Fira',
                fontSize: 27,
                color: Color(0xFF232B3E),
                fontWeight: FontWeight.w600)),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 200,
          child: Wrap(
            children: [
              Text('Keep track of all your Payments in one place.',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                      fontFamily: 'Fira',
                      fontSize: 17,
                      color: Color(0xFF3E4B6C),
                      fontWeight: FontWeight.w400)),
            ],
          ),
        ),

      ],
    );
  }
}
