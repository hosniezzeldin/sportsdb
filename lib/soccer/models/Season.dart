// To parse this JSON data, do
//
//     final seasons = seasonsFromJson(jsonString);

import 'dart:convert';

Seasons seasonsFromJson(String str) => Seasons.fromJson(json.decode(str));

String seasonsToJson(Seasons data) => json.encode(data.toJson());

class Seasons {
  List<Season> seasons;

  Seasons({
    required this.seasons,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) => Seasons(
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
      };
}

class Season {
  String name;

  Season({
    required this.name,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        name: json["strSeason"],
      );

  Map<String, dynamic> toJson() => {
        "strSeason": name,
      };
}
