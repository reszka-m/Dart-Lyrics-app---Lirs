import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/constants.dart';

import 'components/logo.dart';

class Pizda extends StatefulWidget {
  final int artistId;
  static String routeName = '/pizda';

  Pizda({
    Key key,
    this.artistId,
  }) : super(key: key);

  @override
  _PizdaState createState() => _PizdaState(artistId);
}

class _PizdaState extends State<Pizda> {
  Future<Albums> _albums;
  final int artistId;

  _PizdaState(this.artistId);

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
              child: Text("fdf"),
            ),
            Logo(),
            Padding(padding: EdgeInsets.fromLTRB(0, 10.0, 5.0, 2.0)),
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
                                color: Colors.white70,
                                fontStyle: FontStyle.italic,
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
                                    color: kSecondaryColor, fontSize: 14),
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
