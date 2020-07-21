import 'package:flutter/material.dart';

class CardModel{
  static Map<int, Map<String, String>> cards = {
    0: {
      'CardHolder' : 'Joshua',
      'ExpiryDate': '12/20',
      'UserBalance': '3,000',
      'CardNumber': '**** **** **** 3435'
    },
    1: {
      'CardHolder' : 'Praise',
      'ExpiryDate': '09/20',
      'UserBalance': '4,000',
      'CardNumber': '**** **** **** 5245'
    },
    2: {
      'CardHolder' : 'Jeremiah',
      'ExpiryDate': '06/20',
      'UserBalance': '5,000',
      'CardNumber': '**** **** **** 5439'
    },
    3: {
      'CardHolder' : 'Blessing',
      'ExpiryDate': '09/20',
      'UserBalance': '6,000',
      'CardNumber': '**** **** **** 4398'
    },
    4:{
      'CardHolder' : 'Israel',
      'ExpiryDate': '07/20',
      'UserBalance': '10,000',
      'CardNumber': '**** **** **** 1732'
    }
  };

  static Map<int, Map<int, Map<String, String>>> transaction = {
    0:{
      0:{
        'ProductName':'Coffee',
        'Company':'Starbucks',
        'Amount': '-19.54 \$'
      },
      1: {
        'ProductName':'Chicken Nuggets',
        'Company':'McDonalds',
        'Amount': '-50 \$'
      },
      2: {
        'ProductName':'MacBook Pro 15',
        'Company':'Apple',
        'Amount': '-2000 \$'
      }
    }
  };
}