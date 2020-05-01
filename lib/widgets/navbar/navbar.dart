import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/widgets/navbar/site_sliding_segmented_control.dart';

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
      width: double.infinity,
      color: Theme
          .of(context)
          .primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
                height: 32,
                width: 32,
                child: Placeholder()
            ),
          ),
          SlidingSegmentedControlWithThumbUnderneath(
            thumbColor: Theme
                .of(context)
                .accentColor,
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
