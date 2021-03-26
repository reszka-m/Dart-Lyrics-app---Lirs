import 'package:flutter/material.dart';
import 'package:interakcja_zal/constants.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';

import '../../app_icons.dart';
import 'components/logo.dart';
import 'components/top6_list.dart';

class Body1 extends StatefulWidget {
  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  Future<Art> _artist_List;

  @override
  void initState() {
    _artist_List = API_Manager().getArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Logo(),
          Container(
            margin:
                EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding),
            height: 120,
            child: Center(
              child: Text(
                'Top 6 \nartystów z Polski',
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                  fontSize: 34,
                  color: kSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Top6(artist_List: _artist_List, size: size),
        ],
      ),
    );
  }
}
