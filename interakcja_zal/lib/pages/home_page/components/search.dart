import 'package:flutter/material.dart';
import 'package:interakcja_zal/pages/results_page/tracksresults.dart';
import '../../../app_icons.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: 100,
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final searchsongs = [
    "Lose yourself",
    "E.T",
    "Heat",
    "911",
    "Sekunda",
    "Blockbuster Night Part 1",
    "Jedwab",
    "Zonda",
  ];

  final recentsong = [
    "Blockbuster Night Part 1",
    "Jedwab",
    "Zonda",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final recent = query.isEmpty ? recentsong : searchsongs;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          MyFlutterApp.kDisc,
        ),
        title: Text(searchsongs[index]),
      ),
      itemCount: searchsongs.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query.length < 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Dokładna nazwa piosenki lub artysty",
            ),
          )
        ],
      );
    }

    var results = query;
    print(results);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Tracksresults(trackNAME: results),
      ),
    );
  }
}
