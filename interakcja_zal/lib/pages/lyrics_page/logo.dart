import 'package:flutter/material.dart';


import '../../app_icons.dart';
import '../../constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: kDefaultPadding * 1.6),
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
            width: 130,
            height: 42,
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
