import 'package:flutter/material.dart';

Future<Map> cardModel(int index) {
  Future<Map> cardfuture;
  String cardholder;
  String expirydate;
  String userbalance;
  String cardNumber;

  return null;
}

cardDetails(int index) {
  Future<Map> cardfuture;
  var cardholder = ["Joshua", "Praise", "Jeremiah"];
  var expirydate = ["12/20", "9/20", "6/20"];
  var userbalance = ["3,000", "4,000", "5,000"];
  var cardNumber = ["4354545454", "566454423", "343563534"];

  print(cardholder[index] + '\n' + expirydate[index] + '\n' + userbalance[index] + '\n' + cardNumber[index]);
}