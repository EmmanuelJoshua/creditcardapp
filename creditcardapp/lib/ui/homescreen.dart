import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/model/cardmodel.dart';

import '../customIcons.dart';

final Color backgroundColor = Color(0xFFF9F9FA);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.85);
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
              onPressed: () {},
              icon: Icon(Icons.add_circle_outline),
              color: Color(0xFF008BFE),
            )
          ],
        ),
        bottomNavigationBar: FlashyTabBar(
            animationCurve: Curves.linear,
            showElevation: true,
            selectedIndex: _selectedIndex,
            onItemSelected: (index) => setState(() {
                  _selectedIndex = index;
                }),
            items: [
              FlashyTabBarItem(
                  icon: Icon(CustomIcons.home),
                  title: Text('Home',
                      style: TextStyle(
                        fontFamily: 'Fira',
                        fontSize: 13,
                      ))),
              FlashyTabBarItem(
                  icon: Icon(Icons.import_export),
                  title: Text('Transfers',
                      style: TextStyle(
                        fontFamily: 'Fira',
                        fontSize: 13,
                      ))),
              FlashyTabBarItem(
                  icon: Icon(Icons.show_chart),
                  title: Text('Charts',
                      style: TextStyle(
                        fontFamily: 'Fira',
                        fontSize: 13,
                      ))),
              FlashyTabBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings',
                      style: TextStyle(
                        fontFamily: 'Fira',
                        fontSize: 13,
                      ))),
              FlashyTabBarItem(
                  icon: Icon(Icons.person),
                  title: Text('User',
                      style: TextStyle(
                        fontFamily: 'Fira',
                        fontSize: 13,
                      ))),
            ]),
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            Container(
              height: 230,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (int index) {
                  debugPrint('$index');
                  cardDetails(index);
                },
                itemBuilder: (BuildContext context, int index) {
                  return _cardSelector(index);
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
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFE9FBFD),
                        child: Icon(
                          Icons.fastfood,
                          color: Color(0xFF1D2F3D),
                          size: 18,
                        ),
                      ),
                      title: Text('Chicken Nuggets',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 14,
                              color: Color(0xFF232B3E),
                              fontWeight: FontWeight.w600)),
                      subtitle: Text('McDonalds',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 13,
                              color: Color(0xFFC2CDCC),
                              fontWeight: FontWeight.w600)),
                      trailing: Text('-50 \$',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 14,
                              color: Color(0xFFE67095),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFE9FBFD),
                        child: Icon(
                          Icons.laptop_mac,
                          color: Color(0xFF1D2F3D),
                          size: 18,
                        ),
                      ),
                      title: Text('MacBook Pro 15\'',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 14,
                              color: Color(0xFF232B3E),
                              fontWeight: FontWeight.w600)),
                      subtitle: Text('Apple',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 13,
                              color: Color(0xFFC2CDCC),
                              fontWeight: FontWeight.w600)),
                      trailing: Text('-2800 \$',
                          style: TextStyle(
                              fontFamily: 'Fira',
                              fontSize: 14,
                              color: Color(0xFFE67095),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Container(
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
                  )
                ],
              ),
            )

            //TODO: History Implementation

          ],
        ));
  }

  _cardSelector(int index) {
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
                                  text: '\$12,432.32',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Fira',
                                      height: 1.3,
                                      fontWeight: FontWeight.w500)),
                            ])
                          ]),
                        ),
                      ),
                      RichText(
                        text: TextSpan(text: '', children: [
                          new TextSpan(children: [
                            TextSpan(
                                text: 'Bank',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Fira',
                                    height: 0.1,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: ' X',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Fira',
                                    fontWeight: FontWeight.w600)),
                          ])
                        ]),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('**** **** **** 0141',
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
                                text: 'Laurel Bailey',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Fira',
                                    height: 1.3,
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
                                text: '05/22',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Fira',
                                    height: 1.3,
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
