import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/home_page/components/search.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';
import 'components/logo.dart';
import 'components/tekst_glowny.dart';
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
          TekstGlowny(),
          Top6(artist_List: _artist_List, size: size),
          Search(),
        ],
      ),
    );
  }
}
