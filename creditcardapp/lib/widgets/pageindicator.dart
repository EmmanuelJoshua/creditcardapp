import 'package:flutter/material.dart';
import 'package:paymentsystem/providers/indexnotifiers.dart';
import 'package:provider/provider.dart';

class PageIndicator extends StatefulWidget {
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  _isIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: isActive ? 18 : 12,
      height: 7,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isActive ? Color(0xFF232B3E) : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final selectedIndex = Provider.of<IndexNotifier>(context).index;

    List<Widget> _buildIndicators() {
      List<Widget> indicators = new List();

      for (int i = 0; i < 2; i++) {
        indicators.add(i == selectedIndex
            ? _isIndicator(true)
            : _isIndicator(false));
      }
      return indicators;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: _buildIndicators(),
      ),
    );
  }
}
