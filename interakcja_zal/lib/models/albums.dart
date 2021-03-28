// To parse this JSON data, do
//
//     final albums = albumsFromJson(jsonString);

import 'dart:convert';

Albums albumsFromJson(String str) => Albums.fromJson(json.decode(str));

String albumsToJson(Albums data) => json.encode(data.toJson());

class Albums {
  Albums({
    this.message,
  });

  Message message;

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
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
    this.albumList,
  });

  List<AlbumList> albumList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        albumList: List<AlbumList>.from(
            json["album_list"].map((x) => AlbumList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "album_list": List<dynamic>.from(albumList.map((x) => x.toJson())),
      };
}

class AlbumList {
  AlbumList({
    this.album,
  });

  Album album;

  factory AlbumList.fromJson(Map<String, dynamic> json) => AlbumList(
        album: Album.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "album": album.toJson(),
      };
}

class Album {
  Album({
    this.albumId,
    this.albumMbid,
    this.albumName,
    this.albumRating,
    this.albumReleaseDate,
    this.artistId,
    this.artistName,
    this.primaryGenres,
    this.albumPline,
    this.albumCopyright,
    this.albumLabel,
    this.restricted,
    this.updatedTime,
    this.externalIds,
  });

  int albumId;
  String albumMbid;
  String albumName;
  int albumRating;
  DateTime albumReleaseDate;
  int artistId;
  ArtistName artistName;
  PrimaryGenres primaryGenres;
  String albumPline;
  String albumCopyright;
  AlbumLabel albumLabel;
  int restricted;
  DateTime updatedTime;
  ExternalIds externalIds;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumId: json["album_id"],
        albumMbid: json["album_mbid"],
        albumName: json["album_name"],
        albumRating: json["album_rating"],
        albumReleaseDate: DateTime.parse(json["album_release_date"]),
        artistId: json["artist_id"],
        artistName: artistNameValues.map[json["artist_name"]],
        primaryGenres: PrimaryGenres.fromJson(json["primary_genres"]),
        albumPline: json["album_pline"],
        albumCopyright: json["album_copyright"],
        albumLabel: albumLabelValues.map[json["album_label"]],
        restricted: json["restricted"],
        updatedTime: DateTime.parse(json["updated_time"]),
        externalIds: ExternalIds.fromJson(json["external_ids"]),
      );

  Map<String, dynamic> toJson() => {
        "album_id": albumId,
        "album_mbid": albumMbid,
        "album_name": albumName,
        "album_rating": albumRating,
        "album_release_date":
            "${albumReleaseDate.year.toString().padLeft(4, '0')}-${albumReleaseDate.month.toString().padLeft(2, '0')}-${albumReleaseDate.day.toString().padLeft(2, '0')}",
        "artist_id": artistId,
        "artist_name": artistNameValues.reverse[artistName],
        "primary_genres": primaryGenres.toJson(),
        "album_pline": albumPline,
        "album_copyright": albumCopyright,
        "album_label": albumLabelValues.reverse[albumLabel],
        "restricted": restricted,
        "updated_time": updatedTime.toIso8601String(),
        "external_ids": externalIds.toJson(),
      };
}

enum AlbumLabel { PARLOPHONE_UK, THE_576973_RECORDS_DK }

final albumLabelValues = EnumValues({
  "Parlophone UK": AlbumLabel.PARLOPHONE_UK,
  "576973 Records DK": AlbumLabel.THE_576973_RECORDS_DK
});

enum ArtistName { COLDPLAY }

final artistNameValues = EnumValues({"Coldplay": ArtistName.COLDPLAY});

class ExternalIds {
  ExternalIds({
    this.spotify,
    this.itunes,
    this.amazonMusic,
  });

  List<String> spotify;
  List<String> itunes;
  List<dynamic> amazonMusic;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        spotify: List<String>.from(json["spotify"].map((x) => x)),
        itunes: List<String>.from(json["itunes"].map((x) => x)),
        amazonMusic: List<dynamic>.from(json["amazon_music"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "spotify": List<dynamic>.from(spotify.map((x) => x)),
        "itunes": List<dynamic>.from(itunes.map((x) => x)),
        "amazon_music": List<dynamic>.from(amazonMusic.map((x) => x)),
      };
}

class PrimaryGenres {
  PrimaryGenres({
    this.musicGenreList,
  });

  List<MusicGenreList> musicGenreList;

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) => PrimaryGenres(
        musicGenreList: List<MusicGenreList>.from(
            json["music_genre_list"].map((x) => MusicGenreList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "music_genre_list":
            List<dynamic>.from(musicGenreList.map((x) => x.toJson())),
      };
}

class MusicGenreList {
  MusicGenreList({
    this.musicGenre,
  });

  MusicGenre musicGenre;

  factory MusicGenreList.fromJson(Map<String, dynamic> json) => MusicGenreList(
        musicGenre: MusicGenre.fromJson(json["music_genre"]),
      );

  Map<String, dynamic> toJson() => {
        "music_genre": musicGenre.toJson(),
      };
}

class MusicGenre {
  MusicGenre({
    this.musicGenreId,
    this.musicGenreParentId,
    this.musicGenreName,
    this.musicGenreNameExtended,
    this.musicGenreVanity,
  });

  int musicGenreId;
  int musicGenreParentId;
  String musicGenreName;
  String musicGenreNameExtended;
  String musicGenreVanity;

  factory MusicGenre.fromJson(Map<String, dynamic> json) => MusicGenre(
        musicGenreId: json["music_genre_id"],
        musicGenreParentId: json["music_genre_parent_id"],
        musicGenreName: json["music_genre_name"],
        musicGenreNameExtended: json["music_genre_name_extended"],
        musicGenreVanity: json["music_genre_vanity"],
      );

  Map<String, dynamic> toJson() => {
        "music_genre_id": musicGenreId,
        "music_genre_parent_id": musicGenreParentId,
        "music_genre_name": musicGenreName,
        "music_genre_name_extended": musicGenreNameExtended,
        "music_genre_vanity": musicGenreVanity,
      };
}

class Header {
  Header({
    this.statusCode,
    this.executeTime,
    this.available,
  });

  int statusCode;
  double executeTime;
  int available;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        statusCode: json["status_code"],
        executeTime: json["execute_time"].toDouble(),
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "execute_time": executeTime,
        "available": available,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
