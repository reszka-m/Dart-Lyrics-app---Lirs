// To parse this JSON data, do
//
//     final trackks = trackksFromJson(jsonString);

import 'dart:convert';

class Trackks {
    Trackks({
        this.message,
    });

    Message message;

    factory Trackks.fromRawJson(String str) => Trackks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Trackks.fromJson(Map<String, dynamic> json) => Trackks(
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

    factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
        this.trackList,
    });

    List<TrackList> trackList;

    factory Body.fromRawJson(String str) => Body.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        trackList: List<TrackList>.from(json["track_list"].map((x) => TrackList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "track_list": List<dynamic>.from(trackList.map((x) => x.toJson())),
    };
}

class TrackList {
    TrackList({
        this.track,
    });

    String track;

    factory TrackList.fromRawJson(String str) => TrackList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TrackList.fromJson(Map<String, dynamic> json) => TrackList(
        track: json["track"],
    );

    Map<String, dynamic> toJson() => {
        "track": track,
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

    factory Header.fromRawJson(String str) => Header.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
