import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/track.dart';
import 'package:interakcja_zal/pages/albums_page/components/arrow.dart';
import 'package:interakcja_zal/pages/albums_page/components/logo.dart';
import 'package:interakcja_zal/pages/home_page/body1.dart';
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
  Future<Trackks> _tracks;

  final String trackNAME;

  _TracksresultsState(this.trackNAME);

  @override
  void initState() {
    _tracks = API_Manager().getTracks(this.trackNAME);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
            ),
            height: size.height * 0.78,
            child: FutureBuilder<Trackks>(
              future: _tracks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.message.body.trackList.length,
                    itemBuilder: (context, index) {
                      var albums = snapshot.data.message.body.trackList[index];

                      return ListSection(trackList: albums);
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
    @required this.trackList,
  }) : super(key: key);

  final TrackList trackList;

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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text(
                    trackList.track,
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
