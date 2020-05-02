import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/bloc_delegate.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/page.dart';
import 'package:thevinesh/screens/home.dart';
import 'package:thevinesh/screens/resume.dart';
import 'package:thevinesh/widgets/navbar/navbar.dart';

void main() {
  BlocSupervisor.delegate = SiteBlocDelegate();
  runApp(BlocProvider(
    create: (context) => PageBloc(),
    child: SiteApp(),
  ));
}

class SiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SiteTheme.theme,
      title: SiteStrings.appName,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NavBar(),
              Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 1200),
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 16),
                alignment: Alignment.topCenter,
                child: BlocBuilder<PageBloc, PageState>(
                  builder: (context, state) => buildPage(context, state),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context, PageState state) {
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
