import 'package:flutter/material.dart';
import 'package:interakcja_zal/constants.dart';

import '../../../app_icons.dart';



class Disc extends StatelessWidget {
  const Disc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: SizedBox(
          width: 15,
          height: 30,
          child: Icon(
            MyFlutterApp.kDisc,
            size: 25,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
