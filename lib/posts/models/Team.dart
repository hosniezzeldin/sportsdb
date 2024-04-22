// To parse this JSON data, do
//
//     final teams = teamsFromJson(jsonString);

import 'dart:convert';

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));

String teamsToJson(Teams data) => json.encode(data.toJson());

class Teams {
  List<Team> teams;

  Teams({
    required this.teams,
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}

class Team {
  String? idTeam;
  String? idSoccerXml;
  String? idApIfootball;
  dynamic intLoved;
  String name;
  String? strTeamShort;
  String? strAlternate;
  String? intFormedYear;
  String? strSport;
  String? strLeague;
  String? idLeague;
  String? strLeague2;
  String? idLeague2;
  String? strStadium;
  String? strKeywords;
  String? strRss;
  dynamic strStadiumThumb;
  String? strStadiumDescription;
  String? strStadiumLocation;
  String? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? desc;
  String? strDescriptionIt;
  String? strKitColour1;
  String? strKitColour2;
  String? strKitColour3;
  String? strGender;
  String? strCountry;
  String? strTeamBadge;
  String? strTeamJersey;
  String? strYoutube;
  String? strLocked;

  Team({
    this.idTeam,
    this.idSoccerXml,
    this.idApIfootball,
    this.intLoved,
    required this.name,
    this.strTeamShort,
    this.strAlternate,
    this.intFormedYear,
    this.strSport,
    this.strLeague,
    this.idLeague,
    this.strLeague2,
    this.idLeague2,
    this.strStadium,
    this.strKeywords,
    this.strRss,
    this.strStadiumThumb,
    this.strStadiumDescription,
    this.strStadiumLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.desc,
    this.strDescriptionIt,
    this.strKitColour1,
    this.strKitColour2,
    this.strKitColour3,
    this.strGender,
    this.strCountry,
    this.strTeamBadge,
    this.strTeamJersey,
    this.strYoutube,
    this.strLocked,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        idTeam: json["idTeam"],
        idSoccerXml: json["idSoccerXML"],
        idApIfootball: json["idAPIfootball"],
        intLoved: json["intLoved"],
        name: json["strTeam"],
        strTeamShort: json["strTeamShort"],
        strAlternate: json["strAlternate"],
        intFormedYear: json["intFormedYear"],
        strSport: json["strSport"],
        strLeague: json["strLeague"],
        idLeague: json["idLeague"],
        strLeague2: json["strLeague2"],
        idLeague2: json["idLeague2"],
        strStadium: json["strStadium"],
        strKeywords: json["strKeywords"],
        strRss: json["strRSS"],
        strStadiumThumb: json["strStadiumThumb"],
        strStadiumDescription: json["strStadiumDescription"],
        strStadiumLocation: json["strStadiumLocation"],
        intStadiumCapacity: json["intStadiumCapacity"],
        strWebsite: json["strWebsite"],
        strFacebook: json["strFacebook"],
        strTwitter: json["strTwitter"],
        strInstagram: json["strInstagram"],
        desc: json["strDescriptionEN"],
        strDescriptionIt: json["strDescriptionIT"],
        strKitColour1: json["strKitColour1"],
        strKitColour2: json["strKitColour2"],
        strKitColour3: json["strKitColour3"],
        strGender: json["strGender"],
        strCountry: json["strCountry"],
        strTeamBadge: json["strTeamBadge"],
        strTeamJersey: json["strTeamJersey"],
        strYoutube: json["strYoutube"],
        strLocked: json["strLocked"],
      );

  Map<String, dynamic> toJson() => {
        "idTeam": idTeam,
        "idSoccerXML": idSoccerXml,
        "idAPIfootball": idApIfootball,
        "intLoved": intLoved,
        "strTeam": name,
        "strTeamShort": strTeamShort,
        "strAlternate": strAlternate,
        "intFormedYear": intFormedYear,
        "strSport": strSport,
        "strLeague": strLeague,
        "idLeague": idLeague,
        "strLeague2": strLeague2,
        "idLeague2": idLeague2,
        "strStadium": strStadium,
        "strKeywords": strKeywords,
        "strRSS": strRss,
        "strStadiumThumb": strStadiumThumb,
        "strStadiumDescription": strStadiumDescription,
        "strStadiumLocation": strStadiumLocation,
        "intStadiumCapacity": intStadiumCapacity,
        "strWebsite": strWebsite,
        "strFacebook": strFacebook,
        "strTwitter": strTwitter,
        "strInstagram": strInstagram,
        "strDescriptionEN": desc,
        "strDescriptionIT": strDescriptionIt,
        "strKitColour1": strKitColour1,
        "strKitColour2": strKitColour2,
        "strKitColour3": strKitColour3,
        "strGender": strGender,
        "strCountry": strCountry,
        "strTeamBadge": strTeamBadge,
        "strTeamJersey": strTeamJersey,
        "strYoutube": strYoutube,
        "strLocked": strLocked,
      };
}
