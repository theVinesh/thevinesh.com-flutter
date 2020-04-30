import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/page/page.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  SitePage _currentTab;

  Map<SitePage, Widget> _createTabs() {
    Map tabsMap = Map<SitePage, Widget>();
    SitePage.values.forEach((tab) {
      tabsMap.putIfAbsent(tab, () => Text("${tab.toName()}"));
    });
    return tabsMap;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final PageBloc _bloc = BlocProvider.of<PageBloc>(context);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CupertinoSlidingSegmentedControl(
            thumbColor: Colors.red,
            backgroundColor: Colors.transparent,
            children: _createTabs(),
            groupValue: _currentTab ?? _bloc.initialPage,
            onValueChanged: (value) {
              setState(() {
                _currentTab = value;
                _bloc.add(PageChangeClicked(value));
              });
            },
          )
        ],
      ),
    );
  }
}
