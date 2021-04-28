import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/trackorartist.dart';
import 'package:interakcja_zal/pages/results_page/components/upper_bar.dart';
import '../../../constants.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    Key key,
    @required this.size,
    @required Future<Trackks> trackss,
  })  : _trackss = trackss,
        super(key: key);

  final Size size;
  final Future<Trackks> _trackss;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.only(top: kDefaultPadding * 0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kSecondaryColor,
            width: 2.0,
          ),
        ),
      ),
      height: size.height * 0.85,
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
    );
  }
}
