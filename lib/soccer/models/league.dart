// To parse this JSON data, do
//
//     final leagues = leaguesFromJson(jsonString);

import 'dart:convert';

Leagues leaguesFromJson(String str) => Leagues.fromJson(json.decode(str));

String leaguesToJson(Leagues data) => json.encode(data.toJson());

class Leagues {
  List<League> countries;

  Leagues({
    required this.countries,
  });

  factory Leagues.fromJson(Map<String, dynamic> json) => Leagues(
        countries:
            List<League>.from(json["countries"].map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class League {
  String idLeague;
  dynamic idSoccerXml;
  String? idApIfootball;
  String? strSport;
  String name;
  String? strLeagueAlternate;
  String? intDivision;
  String? idCup;
  String? strCurrentSeason;
  String? intFormedYear;
  String? dateFirstEvent;
  String? strGender;
  String? strCountry;
  String? strWebsite;
  String? strFacebook;
  String? strInstagram;
  String? strTwitter;
  String? strYoutube;
  String? strRss;
  String? strDescriptionEn;
  dynamic strDescriptionDe;
  dynamic strDescriptionFr;
  dynamic strDescriptionIt;
  dynamic strDescriptionCn;
  dynamic strDescriptionJp;
  dynamic strDescriptionRu;
  dynamic strDescriptionEs;
  dynamic strDescriptionPt;
  dynamic strDescriptionSe;
  dynamic strDescriptionNl;
  dynamic strDescriptionHu;
  dynamic strDescriptionNo;
  dynamic strDescriptionPl;
  dynamic strDescriptionIl;
  String? strTvRights;
  dynamic strFanart1;
  dynamic strFanart2;
  dynamic strFanart3;
  dynamic strFanart4;
  dynamic strBanner;
  String? strBadge;
  String? strLogo;
  dynamic strPoster;
  dynamic strTrophy;
  String? strNaming;
  dynamic strComplete;
  String? strLocked;

  League({
    required this.idLeague,
    this.idSoccerXml,
    this.idApIfootball,
    this.strSport,
    required this.name,
    this.strLeagueAlternate,
    this.intDivision,
    this.idCup,
    this.strCurrentSeason,
    this.intFormedYear,
    this.dateFirstEvent,
    this.strGender,
    this.strCountry,
    this.strWebsite,
    this.strFacebook,
    this.strInstagram,
    this.strTwitter,
    this.strYoutube,
    this.strRss,
    this.strDescriptionEn,
    this.strDescriptionDe,
    this.strDescriptionFr,
    this.strDescriptionIt,
    this.strDescriptionCn,
    this.strDescriptionJp,
    this.strDescriptionRu,
    this.strDescriptionEs,
    this.strDescriptionPt,
    this.strDescriptionSe,
    this.strDescriptionNl,
    this.strDescriptionHu,
    this.strDescriptionNo,
    this.strDescriptionPl,
    this.strDescriptionIl,
    this.strTvRights,
    this.strFanart1,
    this.strFanart2,
    this.strFanart3,
    this.strFanart4,
    this.strBanner,
    this.strBadge,
    this.strLogo,
    this.strPoster,
    this.strTrophy,
    this.strNaming,
    this.strComplete,
    this.strLocked,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        idLeague: json["idLeague"],
        idSoccerXml: json["idSoccerXML"],
        idApIfootball: json["idAPIfootball"],
        strSport: json["strSport"],
        name: json["strLeague"],
        strLeagueAlternate: json["strLeagueAlternate"],
        intDivision: json["intDivision"],
        idCup: json["idCup"],
        strCurrentSeason: json["strCurrentSeason"],
        intFormedYear: json["intFormedYear"],
        dateFirstEvent: json["dateFirstEvent"],
        strGender: json["strGender"],
        strCountry: json["strCountry"],
        strWebsite: json["strWebsite"],
        strFacebook: json["strFacebook"],
        strInstagram: json["strInstagram"],
        strTwitter: json["strTwitter"],
        strYoutube: json["strYoutube"],
        strRss: json["strRSS"],
        strDescriptionEn: json["strDescriptionEN"],
        strDescriptionDe: json["strDescriptionDE"],
        strDescriptionFr: json["strDescriptionFR"],
        strDescriptionIt: json["strDescriptionIT"],
        strDescriptionCn: json["strDescriptionCN"],
        strDescriptionJp: json["strDescriptionJP"],
        strDescriptionRu: json["strDescriptionRU"],
        strDescriptionEs: json["strDescriptionES"],
        strDescriptionPt: json["strDescriptionPT"],
        strDescriptionSe: json["strDescriptionSE"],
        strDescriptionNl: json["strDescriptionNL"],
        strDescriptionHu: json["strDescriptionHU"],
        strDescriptionNo: json["strDescriptionNO"],
        strDescriptionPl: json["strDescriptionPL"],
        strDescriptionIl: json["strDescriptionIL"],
        strTvRights: json["strTvRights"],
        strFanart1: json["strFanart1"],
        strFanart2: json["strFanart2"],
        strFanart3: json["strFanart3"],
        strFanart4: json["strFanart4"],
        strBanner: json["strBanner"],
        strBadge: json["strBadge"],
        strLogo: json["strLogo"],
        strPoster: json["strPoster"],
        strTrophy: json["strTrophy"],
        strNaming: json["strNaming"],
        strComplete: json["strComplete"],
        strLocked: json["strLocked"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague,
        "idSoccerXML": idSoccerXml,
        "idAPIfootball": idApIfootball,
        "strSport": strSport,
        "strLeague": name,
        "strLeagueAlternate": strLeagueAlternate,
        "intDivision": intDivision,
        "idCup": idCup,
        "strCurrentSeason": strCurrentSeason,
        "intFormedYear": intFormedYear,
        "dateFirstEvent": dateFirstEvent,
        "strGender": strGender,
        "strCountry": strCountry,
        "strWebsite": strWebsite,
        "strFacebook": strFacebook,
        "strInstagram": strInstagram,
        "strTwitter": strTwitter,
        "strYoutube": strYoutube,
        "strRSS": strRss,
        "strDescriptionEN": strDescriptionEn,
        "strDescriptionDE": strDescriptionDe,
        "strDescriptionFR": strDescriptionFr,
        "strDescriptionIT": strDescriptionIt,
        "strDescriptionCN": strDescriptionCn,
        "strDescriptionJP": strDescriptionJp,
        "strDescriptionRU": strDescriptionRu,
        "strDescriptionES": strDescriptionEs,
        "strDescriptionPT": strDescriptionPt,
        "strDescriptionSE": strDescriptionSe,
        "strDescriptionNL": strDescriptionNl,
        "strDescriptionHU": strDescriptionHu,
        "strDescriptionNO": strDescriptionNo,
        "strDescriptionPL": strDescriptionPl,
        "strDescriptionIL": strDescriptionIl,
        "strTvRights": strTvRights,
        "strFanart1": strFanart1,
        "strFanart2": strFanart2,
        "strFanart3": strFanart3,
        "strFanart4": strFanart4,
        "strBanner": strBanner,
        "strBadge": strBadge,
        "strLogo": strLogo,
        "strPoster": strPoster,
        "strTrophy": strTrophy,
        "strNaming": strNaming,
        "strComplete": strComplete,
        "strLocked": strLocked,
      };
}
