import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interakcja_zal/models/albums.dart';

import 'package:interakcja_zal/models/artistsinfo.dart';
import 'package:interakcja_zal/models/lyrics.dart';
import 'package:interakcja_zal/models/trackorartist.dart';

class API_Manager {
  String key = "eb7a33bd10b9eac57fe5fa0905684492";
  Future<Art> getArtists() async {
    var client = http.Client();
    var artistList;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/chart.artists.get?page=1&page_size=6&country=pl&apikey=$key'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var artistList = Art.fromJson(jsonMap);
        print(artistList.message);
        return artistList;
      }
    } catch (Expection) {
      print(Expection);
      return artistList;
    }
    return artistList;
  }

  Future<Albums> getAlbums(wybraneID) async {
    var client = http.Client();
    var albums;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/artist.albums.get?artist_id=${wybraneID}&s_release_date=desc&g_album_name=1&apikey=$key'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var albums = Albums.fromJson(jsonMap);
        print(albums.message.body);
        return albums;
      }
    } catch (Expection) {
      print(Expection);
      return albums;
    }
    return albums;
  }

  Future<Trackks> getTrack(trak) async {
    var client = http.Client();
    var trackks;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/track.search?q_track_artist=${trak}&page_size=30&page=1&s_track_rating=desc&apikey=$key'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var trackks = Trackks.fromJson(jsonMap);
        print(trackks.message.body);
        return trackks;
      }
    } catch (Expection) {
      print(Expection);
      return trackks;
    }
    return trackks;
  }

  Future<Lyrics> getLyrics(lyricid) async {
    var client = http.Client();
    var lyrics;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${lyricid}&apikey=$key'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        var lyrics = Lyrics.fromJson(jsonMap);
        print(lyrics.message.body.lyrics.lyricsBody);
        return lyrics;
      }
    } catch (Expection) {
      print(Expection);
      return lyrics;
    }
    return lyrics;
  }
}
