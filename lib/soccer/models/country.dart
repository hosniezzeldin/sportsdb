// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Countries countryFromJson(String str) => Countries.fromJson(json.decode(str));

String countryToJson(Countries data) => json.encode(data.toJson());

class Countries {
  List<Country>? countries;

  Countries({
    this.countries,
  });

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  String name;

  Country({
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "name_en": name,
      };
}
