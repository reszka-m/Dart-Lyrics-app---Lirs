// To parse this JSON data, do
//
//     final lyrics = lyricsFromJson(jsonString);

import 'dart:convert';

Lyrics lyricsFromJson(String str) => Lyrics.fromJson(json.decode(str));

String lyricsToJson(Lyrics data) => json.encode(data.toJson());

class Lyrics {
  Lyrics({
    this.message,
  });

  Message message;

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(
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
    this.lyrics,
  });

  LyricsClass lyrics;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        lyrics: LyricsClass.fromJson(json["lyrics"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics": lyrics.toJson(),
      };
}

class LyricsClass {
  LyricsClass({
    this.lyricsId,
    this.restricted,
    this.instrumental,
    this.lyricsBody,
    this.lyricsLanguage,
    this.scriptTrackingUrl,
    this.pixelTrackingUrl,
    this.htmlTrackingUrl,
    this.lyricsCopyright,
    this.updatedTime,
  });

  int lyricsId;
  int restricted;
  int instrumental;
  String lyricsBody;
  String lyricsLanguage;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String htmlTrackingUrl;
  String lyricsCopyright;
  DateTime updatedTime;

  factory LyricsClass.fromJson(Map<String, dynamic> json) => LyricsClass(
        lyricsId: json["lyrics_id"],
        restricted: json["restricted"],
        instrumental: json["instrumental"],
        lyricsBody: json["lyrics_body"],
        lyricsLanguage: json["lyrics_language"],
        scriptTrackingUrl: json["script_tracking_url"],
        pixelTrackingUrl: json["pixel_tracking_url"],
        htmlTrackingUrl: json["html_tracking_url"],
        lyricsCopyright: json["lyrics_copyright"],
        updatedTime: DateTime.parse(json["updated_time"]),
      );

  Map<String, dynamic> toJson() => {
        "lyrics_id": lyricsId,
        "restricted": restricted,
        "instrumental": instrumental,
        "lyrics_body": lyricsBody,
        "lyrics_language": lyricsLanguage,
        "script_tracking_url": scriptTrackingUrl,
        "pixel_tracking_url": pixelTrackingUrl,
        "html_tracking_url": htmlTrackingUrl,
        "lyrics_copyright": lyricsCopyright,
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
