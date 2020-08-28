import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/ui/test.dart';

class AddCard extends ModalRoute {
  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);
  final FirebaseDatabase database = FirebaseDatabase.instance;

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
              TestScreen()
            ],
          ),
        ),
      ),
    );
  }
}
