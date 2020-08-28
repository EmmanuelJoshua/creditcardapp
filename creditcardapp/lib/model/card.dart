import 'package:firebase_database/firebase_database.dart';

class Cards{
  String key;
  String cardHolder;
  String expiryDate;
  int userBalance;
  int cardNumber;

  Cards({this.cardHolder, this.expiryDate, this.userBalance, this.cardNumber});

  Cards.fromSnapshot(DataSnapshot snapshot) :
      key = snapshot.key,
      cardHolder = snapshot.value['cardHolder'],
      expiryDate = snapshot.value['expiryDate'],
      userBalance = snapshot.value['userBalance'],
      cardNumber = snapshot.value['cardNumber'];

  Map<dynamic, dynamic> toJson() => {
    'cardHolder': cardHolder,
    'expiryDate': expiryDate,
    'userBalance': userBalance,
    'cardNumber' : cardNumber
  };
}