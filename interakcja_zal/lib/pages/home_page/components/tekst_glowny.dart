import 'package:flutter/material.dart';

import '../../../constants.dart';

class TekstGlowny extends StatelessWidget {
  const TekstGlowny({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
      height: 120,
      child: Center(
        child: Text(
          'Top 6 \nartists in Poland',
          style: TextStyle(
            fontFamily: 'Poppins',
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
            fontSize: 34,
            color: kSecondaryColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
