import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/utils/utils.dart';
import 'package:thevinesh/widgets/widgets.dart';

class ScreenHome extends StatelessWidget {
  static const _vineshRoles = [
    "Think",
    "Code",
    "Design",
    "Sing",
    "Draw",
    "Dream"
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
        _heroView(context),
        Text(
          """
              I am currently an Android Developer at Swiggy. I am curious about almost everything.
            
              When I am not sleeping, eating or coding,I like to Sing, Sketch and dream up about all the cool stuffs to do; which I almost always procrastinate.
            
              Some of those cool stuff I dream about end up in the form of writings
            
              Sign-up to get them in your inbox. I don't spam, I promise 🤞
            """
              .stripMargin(),
          style: Theme.of(context).textTheme.bodyText2,
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
        child: Container(
          constraints: BoxConstraints(
            minHeight: 8 * SizeConfig.blockSizeVertical,
          ),
          margin: EdgeInsets.only(bottom: 32),
          padding: EdgeInsets.all(2 * SizeConfig.biggestBlock),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                color: Theme.of(context).primaryColor,
                offset: Offset(
                  SizeConfig.biggestBlock,
                  SizeConfig.biggestBlock,
                ),
              ),
            ],
          ),
          child: BlocBuilder<TextCycleViewBloc, TextCycleViewState>(
            builder: (context, state) {
              return RichText(
                textScaleFactor: SizeConfig.textScaleFactor,
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: SiteTheme.white),
                  children: [
                    TextSpan(
                      text: "I'm Vinesh Raju, I ",
                      children: [
                        if (state is TextCycleNext)
                          TextSpan(
                            text:
                                _vineshRoles[state.index % _vineshRoles.length],
                            style:
                                Theme.of(context).textTheme.headline5.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: _roleColors[
                                          state.index % _roleColors.length],
                                    ),
                          )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
