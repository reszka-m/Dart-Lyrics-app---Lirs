import 'package:flutter/material.dart';

import '../../../app_icons.dart';
import '../../../constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: kDefaultPadding, top: kDefaultPadding),
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
          child: SizedBox(
            width: 100,
            height: 50,
            child: Icon(
              MyFlutterApp.kLogo,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
