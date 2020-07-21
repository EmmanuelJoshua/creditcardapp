import 'package:flutter/material.dart';

class AddCard extends ModalRoute {
  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  double margin = 170;

  @override
  bool get barrierDismissible => false;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _buildOverlayContent(context);
  }

  Widget _buildOverlayContent(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    TextEditingController cardNumber = new TextEditingController();
    TextEditingController holderName = new TextEditingController();
    return Material(
      type: MaterialType.transparency,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 600),
        padding: EdgeInsets.only(top: margin),
        child: Container(
          decoration: BoxDecoration(borderRadius: radius, color: Colors.white),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onVerticalDragStart: (dragDetails){
                  margin = 210;
                  changedExternalState();
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 2.0,
                          height: 5.0,
                          color: Colors.transparent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 1.5,
                            width: 19,
                            color: Color(0xFFD1D1D3),
                          ),
                        ),
                        Text('Save credit card details',
                            style: TextStyle(
                                fontFamily: 'Fira',
                                fontSize: 16,
                                color: Color(0xFF232B3E),
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Container(
                      height: 55,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 12),
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFF1FAFD),
                                blurRadius: 15.0,
                                offset: Offset(0.3, 4.0))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: TextField(
                        controller: cardNumber,
                        style: TextStyle(
                            fontFamily: 'Fira',
                            fontSize: 16,
                            color: Color(0xFF270F33),
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Enter the Card Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Fira',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            focusColor: Color(0xFF2B1137),
                            fillColor: Color(0xFF2B1137),
                            hoverColor: Color(0xFF2B1137)),
                      ),
                    ),
                    Container(
                      height: 55,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 12),
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFFF1FAFD),
                                blurRadius: 15.0,
                                offset: Offset(0.3, 4.0))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: TextField(
                        controller: holderName,
                        style: TextStyle(
                            fontFamily: 'Fira',
                            fontSize: 16,
                            color: Color(0xFF270F33),
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Enter the Holder Name',
                            hintStyle: TextStyle(
                                fontFamily: 'Fira',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            focusColor: Color(0xFF2B1137),
                            fillColor: Color(0xFF2B1137),
                            hoverColor: Color(0xFF2B1137)),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 280),
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        gradient: LinearGradient(colors: [
                          Color(0xFF354360),
                          Color(0xFF232B3E),
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      ),
                      child: new FlatButton(
                        padding: EdgeInsets.all(10),
                        onPressed: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Fira',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
