import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thevinesh/utils/utils.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig().init(context);

    final avatarImageSize =
        max(ScreenSizeConfig.blockSizeHorizontal, ScreenSizeConfig.blockSizeVertical) * 25;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey,
            height: avatarImageSize,
            width: avatarImageSize,
            margin: EdgeInsets.only(bottom: 16),
            child: FlutterLogo(),
          ),
          Text(
            "I'm Vinesh Raju - Android Developer and Tech Enthusiast.",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            """
                I am currently an Android Developer at Swiggy. I am curious about almost everything.
              
                When I am not sleeping, eating or coding,I like to Sing, Sketch and dream up about all the cool stuffs to do; which I almost always procrastinate.😅
              
                Some of those cool stuff I dream about end up in the form of writings ✍
              
                Sign-up to get them in your inbox. I don't spam, I promise 🤞
              """
                .stripMargin(),
          ),
        ],
      ),
    );
  }
}
