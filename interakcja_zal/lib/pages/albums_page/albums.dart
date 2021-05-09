import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/home_page/body1.dart';

import 'package:intl/intl.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/constants.dart';
import 'components/arrow.dart';
import 'components/logo.dart';

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
          Container(
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
                  child: SizedBox(
                    child: Arrow(),
                  ),
                ),
                Container(
                  width: size.width * 0.91,
                  child: Logo(),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          TopSection(artistNAME: artistNAME, size: size),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
            ),
            height: size.height * 0.78,
            child: FutureBuilder<Albums>(
              future: _albums,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.message.body.albumList.length,
                    itemBuilder: (context, index) {
                      var albums = snapshot.data.message.body.albumList[index];
                      String datastring = DateFormat('yyyy-MM-dd')
                          .format(albums.album.albumReleaseDate);
                      return ListSection(
                          datastring: datastring, albums: albums);
                    },
                  );
                } else
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListSection extends StatelessWidget {
  const ListSection({
    Key key,
    @required this.datastring,
    @required this.albums,
  }) : super(key: key);

  final String datastring;
  final AlbumList albums;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 0, 15.0, 25.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(7, 7),
          ),
        ],
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: kBorderColor,
        ),
      ),
      height: size.height * 0.14,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 100,
            child: Text("Data wydania: " + "\n" + datastring,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.59),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    fontSize: 12),
                textAlign: TextAlign.center),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    albums.album.albumName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
        "Albumy wykonawcy:\n" + artistNAME,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: kSecondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      width: size.width * 0.5,
      height: size.height * 0.1,
    );
  }
}
