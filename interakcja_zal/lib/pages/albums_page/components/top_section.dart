import 'package:flutter/material.dart';

import '../../../constants.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    Key key,
    @required this.artistNAME,
    @required this.size,
  }) : super(key: key);

  final String artistNAME;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: kDefaultPadding * 0.5,
          right: kDefaultPadding * 0.5,
          top: kDefaultPadding * 0.4),
      child: Text(
        "Artist albums:\n" + artistNAME,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: kSecondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      width: size.width * 0.9,
      height: size.height * 0.1,
    );
  }
}
