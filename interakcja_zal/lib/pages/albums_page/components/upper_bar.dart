import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/albums_page/components/arrow.dart';
import 'package:interakcja_zal/pages/albums_page/components/logo.dart';
import 'package:interakcja_zal/pages/home_page/body1.dart';

import '../../../constants.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Body1(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: kDefaultPadding,
              ),
              child: SizedBox(
                child: Arrow(),
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: Logo(),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}