import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thevinesh/utils/screen_size_config.dart';

class TextBackgroundView extends StatelessWidget {
  final Color textColor;
  final String text;
  final double opacity;
  final Widget child;

  static const String _myTrivia =
      "theVinesh. friends call me Vinesh."
      "from Tirunelveli, Tamil Nadu, India. "
      "graduated college from Chennai. "
      "Ex-Zoho, Ex-Meesho. "
      "I love Biriyani and Burritos. "
      "Lives at Bengaluru for now. "
      "Kotlin fanatic, Recently in an affair with Flutter. "
      "My Early morning is 10am. "
      "Android developer, Software Engineer, Designer, Developer, Mobile Developer. "
      "Have an Idea? contact me. Freelance? Yes. "
      "I binge watch random stuff on Youtube. ";

  const TextBackgroundView({
    this.textColor = Colors.black,
    this.opacity = 0.05,
    this.text = _myTrivia,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: lerpDouble(
                  1.5,
                  1.75,
                  max(SizeConfig.blockSizeHorizontal,
                      SizeConfig.blockSizeVertical)),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
