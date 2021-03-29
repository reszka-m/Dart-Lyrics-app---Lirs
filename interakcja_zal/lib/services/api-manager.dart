import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:interakcja_zal/models/albums.dart';

import 'package:interakcja_zal/models/artistsinfo.dart';
import 'package:interakcja_zal/models/lyrics.dart';

class API_Manager {
  Future<Art> getArtists() async {
    var client = http.Client();
    var artistList;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/chart.artists.get?page=1&page_size=6&country=pl&apikey=eb7a33bd10b9eac57fe5fa0905684492'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var artistList = Art.fromJson(jsonMap);
        return artistList;
      }
    } catch (Expection) {
      return artistList;
    }
    return artistList;
  }

  Future<Albums> getAlbums(wybraneID) async {
    var client = http.Client();
    var albums;
    
    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/artist.albums.get?artist_id=${wybraneID}&s_release_date=desc&g_album_name=1&apikey=eb7a33bd10b9eac57fe5fa0905684492'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var albums = Albums.fromJson(jsonMap);

        return albums;
        
      }
    } catch (Expection) {
      return albums;
    }
    return albums;
  }

  Future<Lyrics> getLyrics() async {
    var client = http.Client();
    var lyrics;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?q_track=sexy%20and%20i%20know%20it&q_artist=lmfao&apikey=eb7a33bd10b9eac57fe5fa0905684492'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var lyrics = Lyrics.fromJson(jsonMap);
        return lyrics;
      }
    } catch (Expection) {
      return lyrics;
    }
    return lyrics;
  }
}
