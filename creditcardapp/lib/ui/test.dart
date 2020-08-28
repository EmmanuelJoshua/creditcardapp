import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/model/card.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController cardNumber = new TextEditingController();
  TextEditingController holderName = new TextEditingController();
  Cards card;
  List<Cards> credits = List();
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    card = Cards(cardHolder: '', cardNumber: 0, expiryDate: '', userBalance: 200000);
    databaseReference = database.reference().child('credit_cards');
  }

  handleSaveCard(){
    if(cardNumber.value.text.isEmpty || holderName.value.text.isEmpty){

    }else{
      int cardNum = int.parse(cardNumber.value.text);
      String holderNa = holderName.value.text;
      card.cardHolder = holderNa;
      card.cardNumber = cardNum;
      setState(() {
        databaseReference.push().set(card.toJson());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    handleSaveCard();
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
    );
  }
}
