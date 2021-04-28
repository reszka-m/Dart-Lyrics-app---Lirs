import 'dart:math';

import 'package:flutter/material.dart';

import '../../../app_icons.dart';
import '../../../constants.dart';

class Arrow extends StatelessWidget {
  const Arrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: kDefaultPadding,
        ),
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A6EED),
              Color(0xFF2AF870),
            ],
          ).createShader(bounds),
          child: Transform.rotate(
            angle: 180 * pi / 180,
            child: Icon(
              MyFlutterApp.kArrow,
              size: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
