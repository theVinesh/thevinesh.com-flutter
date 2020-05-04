import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thevinesh/utils/utils.dart';
import 'package:thevinesh/widgets/widgets.dart';

class ScreenHome extends StatelessWidget {
  static const _vineshRoles = [
    "Tech Enthusiast",
    "Tinkerer",
    "Software Developer",
    "Lazy Human"
  ];

  static const _roleColors = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _heroView(),
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

  Widget _heroView() => Stack(
    alignment: Alignment.bottomLeft,
        children: [
          Placeholder(),
          Container(
            margin: EdgeInsets.all(8),
            height: 52 * SizeConfig.textScaleFactor,
            alignment: Alignment.topLeft,
            child: BlocBuilder<TextCycleViewBloc, TextCycleViewState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<TextCycleViewBloc>(context)
                        .add(TextCycleOnNext());
                  },
                  onHover: (hover) {
                    if (hover) {
                      BlocProvider.of<TextCycleViewBloc>(context)
                          .add(TextCyclePaused());
                    } else {
                      BlocProvider.of<TextCycleViewBloc>(context)
                          .add(TextCycleResumed());
                    }
                  },
                  child: RichText(
                    textScaleFactor: SizeConfig.textScaleFactor,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        TextSpan(
                          text: "I'm Vinesh Raju - ",
                        ),
                        if (state is TextCycleNext)
                          TextSpan(
                            text: _vineshRoles[state.index % _vineshRoles.length],
                            style: Theme.of(context).textTheme.headline5.copyWith(
                                color: _roleColors[
                                    state.index % _roleColors.length]),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
}
