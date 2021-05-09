import 'package:flutter/material.dart';
import 'package:interakcja_zal/models/trackorartist.dart';
import 'package:interakcja_zal/pages/results_page/components/list_section.dart';
import 'package:interakcja_zal/services/api-manager.dart';
import 'components/upper_bar.dart';

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
          UpperBar(size: size),
          ListSection(size: size, trackss: _trackss),
        ],
      ),
    );
  }
}
