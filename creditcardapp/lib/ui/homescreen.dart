//import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/model/cardmodel.dart';
import 'package:paymentsystem/ui/addcard.dart';
import 'package:paymentsystem/widgets/creditcard.dart';
import 'package:paymentsystem/widgets/transactionitem.dart';

import '../customIcons.dart';

final Color backgroundColor = Color(0xFFF9F9FA);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int initialPage = 1;
  Map<int, Map<String, String>> transactions;

  loadTransactions(int index) {
    setState(() {
      transactions = CardModel.transaction[index];
    });
  }

  @override
  void initState() {
    super.initState();
//    loadTransactions(initialPage);
    _pageController = PageController(initialPage: initialPage, viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: backgroundColor,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(CustomIcons.menu),
              color: Color(0xFF232B3E)),
          title: Text(
            'My Cards',
            style: TextStyle(
                fontFamily: 'Fira', fontSize: 17, color: Color(0xFF232B3E)),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(AddCard());
              },
              icon: Icon(Icons.add_circle_outline),
              color: Color(0xFF008BFE),
            )
          ],
        ),
//        bottomNavigationBar: FlashyTabBar(
//            animationCurve: Curves.linear,
//            showElevation: true,
//            selectedIndex: _selectedIndex,
//            onItemSelected: (index) => setState(() {
//                  _selectedIndex = index;
//                }),
//            items: [
//              FlashyTabBarItem(
//                  icon: Icon(CustomIcons.home),
//                  title: Text('Home',
//                      style: TextStyle(
//                        fontFamily: 'Fira',
//                        fontSize: 13,
//                      ))),
//              FlashyTabBarItem(
//                  icon: Icon(Icons.import_export),
//                  title: Text('Transfers',
//                      style: TextStyle(
//                        fontFamily: 'Fira',
//                        fontSize: 13,
//                      ))),
//              FlashyTabBarItem(
//                  icon: Icon(Icons.show_chart),
//                  title: Text('Charts',
//                      style: TextStyle(
//                        fontFamily: 'Fira',
//                        fontSize: 13,
//                      ))),
//              FlashyTabBarItem(
//                  icon: Icon(Icons.settings),
//                  title: Text('Settings',
//                      style: TextStyle(
//                        fontFamily: 'Fira',
//                        fontSize: 13,
//                      ))),
//              FlashyTabBarItem(
//                  icon: Icon(Icons.person),
//                  title: Text('User',
//                      style: TextStyle(
//                        fontFamily: 'Fira',
//                        fontSize: 13,
//                      ))),
//            ]),
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            Container(
              height: 230,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: CardModel.cards.length,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  debugPrint('$index');
                  loadTransactions(index);
//                  cardDetails(index);
                },
                itemBuilder: (BuildContext context, int index) {
                  return CreditCard(
                      pageController: _pageController, index: index);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Transactions',
                      style: TextStyle(
                          fontFamily: 'Fira',
                          fontSize: 17,
                          color: Color(0xFF232B3E),
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 18,
              ),
              child: Text('Today',
                  style: TextStyle(
                      fontFamily: 'Fira',
                      fontSize: 15,
                      color: Color(0xFFC2CDCC),
                      fontWeight: FontWeight.w600)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.only(top: 10, left: 3, right: 5),
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionItem(transactions: transactions);
                },
              ),
            )
          ],
        ));
  }
}
