import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thevinesh/utils/screen_size_config.dart';

class TextBackgroundView extends StatelessWidget {
  final Color textColor;
  final String text;
  final double opacity;
  final Widget child;

  static const String _sampleText =
      "Lorem ipsum dolor sit amet, leo malesuada orci pede mauris porttitor, "
      "wisi at posuere. Nulla aliquam ligula volutpat, in neque velit, tortor odio, "
      "rutrum cum suspendisse in a mi, pellentesque sociosqu. Vestibulum ut magna "
      "nec elit malesuada, amet risus consequat, consequat faucibus, natoque "
      "nisl odio erat tellus integer integer. Netus justo fusce leo, vel ligula "
      "purus erat sit non, erat ipsum aliquam mi tempor. In a nec quis viverra "
      "eu luctus, sem nulla arcu, id quam elit ante ipsum viverra consequat.";

  const TextBackgroundView({
    this.textColor = Colors.black,
    this.opacity = 0.05,
    this.text = _sampleText,
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
              textScaleFactor: lerpDouble(1.5, 1.75, max(
                  SizeConfig.blockSizeHorizontal,
                  SizeConfig.blockSizeVertical)),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
