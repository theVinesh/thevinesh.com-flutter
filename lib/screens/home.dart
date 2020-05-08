import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/utils/utils.dart';
import 'package:thevinesh/widgets/widgets.dart';

class ScreenHome extends StatelessWidget {
  static const _verbs = [
    "Dream",
    "Think",
    "Design",
    "Code",
    "Make",
    "Sing",
    "Sketch",
    "Cook",
    "Party",
  ];

  static const _roleColors = [
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline2,
            children: [
              TextSpan(text: "hi"),
            ],
          ),
          textScaleFactor: SizeConfig.textScaleFactor,
        ),
        _heroView(context),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText2,
            children: [
              TextSpan(
                  text:
                      "Lorem imsum dolor sit.Lorem imsum dolor sit.\n\nLorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.\n\nLorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit.Lorem imsum dolor sit."),
            ],
          ),
          textScaleFactor: SizeConfig.textScaleFactor,
        ),
      ],
    );
  }

  Widget _heroView(BuildContext context) => InkResponse(
        onTap: () {
          BlocProvider.of<TextCycleViewBloc>(context).add(TextCycleOnNext());
        },
        onHover: (hover) {
          if (hover) {
            BlocProvider.of<TextCycleViewBloc>(context).add(TextCyclePaused());
          } else {
            BlocProvider.of<TextCycleViewBloc>(context).add(TextCycleResumed());
          }
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: ShadowBoxView(
            minHeight: 8 * SizeConfig.blockSizeVertical,
            padding: EdgeInsets.all(2 * SizeConfig.biggestBlock),
            child: BlocBuilder<TextCycleViewBloc, TextCycleViewState>(
              builder: (context, state) {
                return RichText(
                  textScaleFactor: SizeConfig.textScaleFactor,
                  text: TextSpan(
                    style: Theme.of(context).primaryTextTheme.headline5,
                    children: [
                      TextSpan(
                        text: "I'm Vinesh Raju, I like to ",
                      ),
                      if (state is TextCycleNext)
                        TextSpan(
                          text: _verbs[state.index % _verbs.length],
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                decoration: TextDecoration.underline,
                                color:
                                    _roleColors[state.index % _roleColors.length],
                              ),
                        ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );
}
