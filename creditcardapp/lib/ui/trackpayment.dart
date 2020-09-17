import 'package:flutter/material.dart';

class TrackPayment extends StatefulWidget {
  @override
  _TrackPaymentState createState() => _TrackPaymentState();
}

class _TrackPaymentState extends State<TrackPayment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Track Payment',
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
      ),
    );
  }
}
