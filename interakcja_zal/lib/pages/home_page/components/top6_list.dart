import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/artistsinfo.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import '../../../constants.dart';
import '../pizda.dart';



class Top6 extends StatelessWidget {
  const Top6({
    Key key,
    @required this.size,
    @required Future<Art> artist_List,
    this.keyArtist,
    this.artistId,
  })  : _artist_List = artist_List,
        super(key: key);

  final Size size;
  final String keyArtist;
  final int artistId;
  final Future<Art> _artist_List;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Art>(
      future: _artist_List,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var artists1 = snapshot.data.message.body.artistList[0];
          var artists2 = snapshot.data.message.body.artistList[1];
          var artists3 = snapshot.data.message.body.artistList[2];
          var artists4 = snapshot.data.message.body.artistList[3];
          var artists5 = snapshot.data.message.body.artistList[4];
          var artists6 = snapshot.data.message.body.artistList[5];

          int artistId;

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists1.artist.artistName),
                    onDoubleTap: () {
                      print(artists1.artist.artistId);
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists1.artist.artistId,
                                )),
                      );
                    },
                  ),
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists2.artist.artistName),
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists2.artist.artistId,
                                )),
                      );
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists3.artist.artistName),
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists3.artist.artistId,
                                )),
                      );
                    },
                  ),
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists4.artist.artistName),
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists4.artist.artistId,
                                )),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists5.artist.artistName),
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists5.artist.artistId,
                                )),
                      );
                    },
                  ),
                  GestureDetector(
                    child: SingleTile(
                        size: size, keyArtist: artists6.artist.artistName),
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pizda(
                                  artistId: artists6.artist.artistId,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        } else
          return CircularProgressIndicator();
      },
    );
  }
}

class SingleTile extends StatelessWidget {
  const SingleTile({
    Key key,
    @required this.size,
    @required this.keyArtist,
  }) : super(key: key);

  final Size size;
  final String keyArtist;

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
      height: size.height * 0.14,
      width: size.width * 0.44,
      child: Center(
        child: Text(
          keyArtist,
          style: TextStyle(color: Colors.white.withOpacity(0.59)),
        ),
      ),
    );
  }
}
