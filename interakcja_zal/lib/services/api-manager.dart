import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:interakcja_zal/models/artistsinfo.dart';

class API_Manager {
  Future<Art> getArtists() async {
    var client = http.Client();
    var artistList;

    try {
      var response = await client.get(Uri.parse(
          'https://api.musixmatch.com/ws/1.1/chart.artists.get?page=1&page_size=3&country=it&apikey=eb7a33bd10b9eac57fe5fa0905684492'));

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
}
