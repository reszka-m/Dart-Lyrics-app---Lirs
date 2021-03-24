// To parse this JSON data, do
//
//     final art = artFromJson(jsonString);

import 'dart:convert';

Art artFromJson(String str) => Art.fromJson(json.decode(str));

String artToJson(Art data) => json.encode(data.toJson());

class Art {
  Art({
    this.message,
  });

  Message message;

  factory Art.fromJson(Map<String, dynamic> json) => Art(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  Message({
    this.header,
    this.body,
  });

  Header header;
  Body body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        header: Header.fromJson(json["header"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    this.artistList,
  });

  List<ArtistList> artistList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        artistList: List<ArtistList>.from(
            json["artist_list"].map((x) => ArtistList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artist_list": List<dynamic>.from(artistList.map((x) => x.toJson())),
      };
}

class ArtistList {
  ArtistList({
    this.artist,
  });

  Artist artist;

  factory ArtistList.fromJson(Map<String, dynamic> json) => ArtistList(
        artist: Artist.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "artist": artist.toJson(),
      };
}

class Artist {
  Artist({
    this.artistId,
    this.artistMbid,
    this.artistName,
    this.artistAliasList,
    this.artistRating,
    this.updatedTime,
  });

  int artistId;
  String artistMbid;
  String artistName;
  List<dynamic> artistAliasList;
  int artistRating;
  DateTime updatedTime;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        artistId: json["artist_id"],
        artistMbid: json["artist_mbid"],
        artistName: json["artist_name"],
        artistAliasList:
            List<dynamic>.from(json["artist_alias_list"].map((x) => x)),
        artistRating: json["artist_rating"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "artist_id": artistId,
        "artist_mbid": artistMbid,
        "artist_name": artistName,
        "artist_alias_list": List<dynamic>.from(artistAliasList.map((x) => x)),
        "artist_rating": artistRating,
        "updated_time": updatedTime.toIso8601String(),
      };
}

class Header {
  Header({
    this.statusCode,
    this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
      };
}
