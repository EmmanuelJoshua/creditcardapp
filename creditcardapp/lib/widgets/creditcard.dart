import 'package:flutter/material.dart';
import 'package:paymentsystem/model/card.dart';
import 'package:paymentsystem/model/cardmodel.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key key,
    @required PageController pageController,
    @required this.index, this.credits,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final int index;
  final List<Cards> credits;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.35) + 0.01).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270,
            width: Curves.easeInOut.transform(value) * 400,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.00),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xFF232B3E),
                  gradient: LinearGradient(colors: [
                    Color(0xFF354360),
                    Color(0xFF232B3E),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF95DFFF),
                        blurRadius: 10.0,
                        offset: Offset(10.0, 10.0))
                  ]),
              child: Center(
                  child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: RichText(
                          text: TextSpan(text: '', children: [
                            new TextSpan(children: [
                              TextSpan(
                                  text: 'Current Balance\n',
                                  style: TextStyle(
                                      color: Color(0xFFD5DDDC),
                                      fontSize: 12,
                                      fontFamily: 'Fira',
                                      height: 0.1,
                                      fontWeight: FontWeight.w500)),
                              TextSpan(
                                  text: '\$${credits[index].userBalance}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Fira',
                                      height: 1.5,
                                      fontWeight: FontWeight.w500)),
                            ])
                          ]),
                        ),
                      ),
//                      RichText(
//                        text: TextSpan(text: '', children: [
//                          new TextSpan(children: [
//                            TextSpan(
//                                text: 'Bank',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 13,
//                                    fontFamily: 'Fira',
//                                    height: 0.1,
//                                    fontWeight: FontWeight.w500)),
//                            TextSpan(
//                                text: ' X',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 15,
//                                    fontFamily: 'Fira',
//                                    fontWeight: FontWeight.w600)),
//                          ])
//                        ]),
//                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('${credits[index].cardNumber}',
                          style: TextStyle(
                              letterSpacing: 4,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Fira',
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(text: '', children: [
                          new TextSpan(children: [
                            TextSpan(
                                text: 'Card Holder\n',
                                style: TextStyle(
                                    color: Color(0xFFD5DDDC),
                                    fontSize: 12,
                                    fontFamily: 'Fira',
                                    height: 0.1,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: credits[index].cardHolder,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Fira',
                                    height: 1.4,
                                    fontWeight: FontWeight.w500)),
                          ])
                        ]),
                      ),
                      RichText(
                        text: TextSpan(text: '', children: [
                          new TextSpan(children: [
                            TextSpan(
                                text: 'Expires\n',
                                style: TextStyle(
                                    color: Color(0xFFD5DDDC),
                                    fontSize: 12,
                                    fontFamily: 'Fira',
                                    height: 0.1,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: '${credits[index].expiryDate}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Fira',
                                    height: 1.4,
                                    fontWeight: FontWeight.w500)),
                          ])
                        ]),
                      ),
                      Image.asset(
                        'assets/images/mastercard.png',
                        width: 28,
                        height: 28,
                      )
                    ],
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
