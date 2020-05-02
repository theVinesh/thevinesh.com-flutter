import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/screens/screens.dart';

class PageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 400, maxWidth: 1000),
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      alignment: Alignment.topCenter,
      child: BlocBuilder<PageBloc, PageState>(
        builder: (context, state) => _buildPage(context, state),
      ),
    );
  }

  Widget _buildPage(BuildContext context, PageState state) {
    if (state is PageLoadSuccess) {
      switch (state.page) {
        case SitePage.resume:
          return ScreenResume();
        default:
          return ScreenHome();
      }
    } else {
      return Text("Loading");
    }
  }
}