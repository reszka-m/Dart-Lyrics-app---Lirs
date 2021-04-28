import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/albums.dart';

import '../../../constants.dart';

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