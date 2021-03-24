import 'package:flutter/material.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Art> _artist_list;

  @override
  void initState() {
    _artist_list = API_Manager().getArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lyrics')),
      body: Container(
          child: FutureBuilder<Art>(
        future: _artist_list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.message.body.artistList.length,
                itemBuilder: (context, index) {
                  var artistsList = snapshot.data.message.body.artistList[index];
                  return Container(
                    height: 100,
                    color: Colors.blue[100],
                    child: Row(
                      children: <Widget>[
                        Text(artistsList.artist.artistName, textAlign: TextAlign.center)
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
