import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';

import '../../constants.dart';
import '../../constants.dart';

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
      body: Container(
        child: FutureBuilder<Albums>(
          future: _albums,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.message.body.albumList.length,
                itemBuilder: (context, index) {
                  var albums = snapshot.data.message.body.albumList[index];
                  return Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 3.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            child: Text(
                              albums.album.albumName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFF12F351)),
                            ),
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

class SingleAlbum extends StatelessWidget {
  const SingleAlbum({
    @required this.singlealbum,
  });
  final String singlealbum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.25),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: kBorderColor,
        ),
      ),
      width: 100,
      child: Center(
        child: Text(
          singlealbum,
          style: TextStyle(color: Colors.white.withOpacity(0.59)),
        ),
      ),
    );
  }
}
