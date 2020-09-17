import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/ui/homescreen.dart';
import 'package:paymentsystem/ui/onboarding.dart';

void main() {
  runApp(MyApp());
}
//creditcardapp-6d907

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboarding(),
    );
  }
}