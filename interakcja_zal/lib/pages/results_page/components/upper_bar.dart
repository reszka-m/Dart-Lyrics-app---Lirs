import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/trackorartist.dart';
import 'package:interakcja_zal/pages/home_page/body1.dart';
import 'package:interakcja_zal/pages/lyrics_page/lyricccs.dart';
import 'package:interakcja_zal/pages/results_page/components/arrow.dart';
import 'package:interakcja_zal/pages/results_page/components/logo.dart';


import '../../../constants.dart';
import 'disc.dart';


class UpperBar extends StatelessWidget {
  const UpperBar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Padding(
              padding: EdgeInsets.only(left: kDefaultPadding),
              child: SizedBox(
                child: Arrow(),
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: Logo(),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class Tracks extends StatelessWidget {
  const Tracks({
    Key key,
    @required this.size,
    @required this.albums,
  }) : super(key: key);

  final Size size;
  final TrackList albums;

  @override
  Widget build(BuildContext context) {
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
      height: size.height * 0.11,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Disc(),
            ],
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print(albums.track.trackId);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Lyricsresult(lyricsID: albums.track.trackId),
                      ),
                    );
                  },
                  child: Text(
                    albums.track.artistName + "\n" + albums.track.trackName,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}