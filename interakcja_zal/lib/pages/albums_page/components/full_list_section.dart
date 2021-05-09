import 'package:flutter/material.dart';
import 'package:interakcja_zal/constants.dart';
import 'package:interakcja_zal/models/albums.dart';
import 'package:interakcja_zal/pages/albums_page/components/list_section.dart';
import 'package:intl/intl.dart';

class FullListSection extends StatelessWidget {
  const FullListSection({
    Key key,
    @required this.size,
    @required Future<Albums> albums,
  }) : _albums = albums, super(key: key);

  final Size size;
  final Future<Albums> _albums;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kDefaultPadding * 0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: kSecondaryColor, width: 2.0),
        ),
      ),
      height: size.height * 0.78,
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
                return ListSection(
                    datastring: datastring, albums: albums);
              },
            );
          } else
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        },
      ),
    );
  }
}