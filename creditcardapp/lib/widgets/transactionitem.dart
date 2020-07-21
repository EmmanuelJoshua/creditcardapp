import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key, @required this.transactions,
  }) : super(key: key);

  final Map<int, Map<String, String>> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xFFE9FBFD),
          child: Icon(
            Icons.local_drink,
            color: Color(0xFF1D2F3D),
            size: 18,
          ),
        ),
        title: Text('Coffee',
            style: TextStyle(
                fontFamily: 'Fira',
                fontSize: 14,
                color: Color(0xFF232B3E),
                fontWeight: FontWeight.w600)),
        subtitle: Text('Starbucks',
            style: TextStyle(
                fontFamily: 'Fira',
                fontSize: 13,
                color: Color(0xFFC2CDCC),
                fontWeight: FontWeight.w600)),
        trailing: Text('-19.54 \$',
            style: TextStyle(
                fontFamily: 'Fira',
                fontSize: 14,
                color: Color(0xFFE67095),
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}