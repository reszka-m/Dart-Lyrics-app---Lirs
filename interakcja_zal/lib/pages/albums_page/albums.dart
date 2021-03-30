import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/home_page/components/logo.dart';
import 'package:intl/intl.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/constants.dart';



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
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              child: Logo(),
            ),
            SizedBox(
              child: Text(
                "Albumy wykonawcy:\n" + artistNAME,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              width: 250,
            ),
          ],
        ),
      ),
      body: Container(
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
                  return Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black54, width: 4.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Data wydania: " + "\n" + datastring,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.59),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                albums.album.albumName,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
