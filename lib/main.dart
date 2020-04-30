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
        body: Column(
          children: [
            NavBar(),
            BlocBuilder<PageBloc, PageState>(
              builder: (context, state) => buildPage(context, state),
            )
          ],
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
