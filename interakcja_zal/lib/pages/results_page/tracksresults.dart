import 'package:flutter/material.dart';
import 'package:interakcja_zal/app_icons.dart';
import 'package:interakcja_zal/models/trackorartist.dart';

import 'package:interakcja_zal/pages/home_page/body1.dart';
import 'package:interakcja_zal/pages/results_page/arrow.dart';
import 'package:interakcja_zal/pages/results_page/logo.dart';
import 'package:interakcja_zal/services/api-manager.dart';

import '../../constants.dart';

class Tracksresults extends StatefulWidget {
  final String trackNAME;

  Tracksresults({
    Key key,
    this.trackNAME,
  }) : super(key: key);

  @override
  _TracksresultsState createState() => _TracksresultsState(trackNAME);
}

class _TracksresultsState extends State<Tracksresults> {
  Future<Trackks> _trackss;

  final String trackNAME;

  _TracksresultsState(this.trackNAME);

  @override
  void initState() {
    _trackss = API_Manager().getTrack(this.trackNAME);
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
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
            ),
            height: size.height * 0.78,
            child: FutureBuilder<Trackks>(
              future: _trackss,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.message.body.trackList.length,
                    itemBuilder: (context, index) {
                      var albums = snapshot.data.message.body.trackList[index];
                      return Tracks(size: size, albums: albums);
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(MyFlutterApp.kDisc),
            ],
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    albums.track.artistName + "\n" + albums.track.trackName,
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
