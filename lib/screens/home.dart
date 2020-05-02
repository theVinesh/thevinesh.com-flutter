import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thevinesh/utils/utils.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi", style: Theme
              .of(context)
              .textTheme
              .caption,),
          Text("I am Vinesh Raju"),
          Text("""
                I am currently an Android Developer at Swiggy. I am curious about almost everything.
              
                When I am not sleeping, eating or coding,I like to Sing, Sketch and dream up about all the cool stuffs to do; which I almost always procrastinate.😅
              
                Some of those cool stuff I dream about end up in the form of writings ✍
              
                Sign-up to get them in your inbox. I don't spam, I promise 🤞
              """
              .stripMargin()),
        ],
      ),
    );
  }
}
