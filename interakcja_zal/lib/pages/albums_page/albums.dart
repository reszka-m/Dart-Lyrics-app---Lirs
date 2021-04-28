import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/albums_page/components/full_list_section.dart';
import 'package:interakcja_zal/pages/albums_page/components/top_section.dart';
import 'package:interakcja_zal/pages/albums_page/components/upper_bar.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';

class Pizda extends StatefulWidget {
  final int artistId;
  final String artistNAME;
  static String routeName = '/pizda';

  Pizda({
    Key key,
    this.artistId,
    this.artistNAME,
  }) : super(key: key);

  @override
  _PizdaState createState() => _PizdaState(artistId, artistNAME);
}

class _PizdaState extends State<Pizda> {
  Future<Albums> _albums;
  final int artistId;
  final String artistNAME;

  _PizdaState(this.artistId, this.artistNAME);

  @override
  void initState() {
    _albums = API_Manager().getAlbums(this.artistId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          UpperBar(size: size),
          TopSection(artistNAME: artistNAME, size: size),
          FullListSection(size: size, albums: _albums),
        ],
      ),
    );
  }
}
