import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:paymentsystem/providers/indexnotifiers.dart';
import 'package:paymentsystem/providers/offsetnotifiers.dart';
import 'package:paymentsystem/ui/homescreen.dart';
import 'package:paymentsystem/ui/makepayment.dart';
import 'package:paymentsystem/ui/trackpayment.dart';
import 'package:paymentsystem/utils/fadepageroute.dart';
import 'package:paymentsystem/widgets/pageindicator.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  AnimationController _controller;
  PageController _pageController;

  @override
  void initState() {
    _controller = AnimationController(vsync: this)
      ..value = 0.0
      ..addListener(() {
        setState(() {});
      });
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => OffsetNotifier(_pageController),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              width: deviceSize.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF354360),
                  Color(0xFF232B3E),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Lottie.asset('assets/images/payanim.json',
                    controller: _controller, onLoaded: (composition) {
                  _controller..duration = composition.duration;
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  Provider.of<IndexNotifier>(context, listen: false).index =
                      index;
                  var start = 0.0;
                  var stop = 0.7;
                  if (index == 0) {
                    _controller.animateTo(start,
                        duration: Duration(milliseconds: 1400));
                  } else if (index == 1) {
                    _controller.animateTo(stop);
                  }
                },
                children: [TrackPayment(), MakePayment()],
              ),
            ),
            Container(
              color: Color(0xFFEEEEED),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PageIndicator(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: new FlatButton(
                      onPressed: () {
                        var router = FadePageRoute(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => HomeScreen());
                        Navigator.of(context).pushReplacement(router);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                                color: Color(0xFF232B3E),
                                fontFamily: 'Fira',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.arrow_right_alt_rounded,
                              color: Color(0xFF232B3E)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
