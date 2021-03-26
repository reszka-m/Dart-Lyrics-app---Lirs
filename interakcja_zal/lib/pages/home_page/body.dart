import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Albums> _albums;

  @override
  void initState() {
    _albums = API_Manager().getAlbums();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.thumb_down),
      ),
      body: Container(
          child: FutureBuilder<Albums>(
        future: _albums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.message.body.albumList.length,
                itemBuilder: (context, index) {
                  var artistsList =
                      snapshot.data.message.body.albumList[index];
                  return Container(
                    height: 100,
                    color: Colors.blue[100],
                    child: Row(
                      children: <Widget>[
                        Text(artistsList.album.albumName,
                            textAlign: TextAlign.center)
                      ],
                    ),
                  );
                });
          } else
            return CircularProgressIndicator();
        },
      )),
    );
  }
}
