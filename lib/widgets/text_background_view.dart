import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thevinesh/utils/screen_size_config.dart';

class TextBackgroundView extends StatelessWidget {
  final Color textColor;
  final String text;
  final double opacity;
  final Widget child;

  final double _scaleFactor = 8;
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
    ScreenSizeConfig().init(context);
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: Container(
            width: ScreenSizeConfig.screenWidth,
            height: ScreenSizeConfig.screenHeight,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: _scaleFactor * ScreenSizeConfig.blockSizeHorizontal),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
