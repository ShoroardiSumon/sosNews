// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.news,
  });

  News news;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        news: News.fromJson(json["news"]),
      );

  Map<String, dynamic> toJson() => {
        "news": news.toJson(),
      };
}

class News {
  News({
    this.nature,
    this.sports,
    this.international,
  });

  List<International> nature;
  List<International> sports;
  List<International> international;

  factory News.fromJson(Map<String, dynamic> json) => News(
        nature: List<International>.from(
            json["nature"].map((x) => International.fromJson(x))),
        sports: List<International>.from(
            json["sports"].map((x) => International.fromJson(x))),
        international: List<International>.from(
            json["international"].map((x) => International.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nature": List<dynamic>.from(nature.map((x) => x.toJson())),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "international":
            List<dynamic>.from(international.map((x) => x.toJson())),
      };
}

class International {
  International({
    this.title,
    this.subtitle,
    this.picture,
    this.description,
  });

  String title;
  String subtitle;
  String picture;
  String description;

  factory International.fromJson(Map<String, dynamic> json) => International(
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "description": description,
      };
}

enum Subtitle {
  WORLD_POLITICS,
  NATURAL_BEAUTY_OF_BANGLADESH,
  BANGLADESH_CRICKET_TIGERS
}

final subtitleValues = EnumValues({
  "Bangladesh Cricket Tigers": Subtitle.BANGLADESH_CRICKET_TIGERS,
  "Natural Beauty of Bangladesh": Subtitle.NATURAL_BEAUTY_OF_BANGLADESH,
  "World Politics": Subtitle.WORLD_POLITICS
});

enum Title { INTERNATIONAL, NATURAL_BEAUTY, CRICKET }

final titleValues = EnumValues({
  "Cricket": Title.CRICKET,
  "International": Title.INTERNATIONAL,
  "Natural Beauty": Title.NATURAL_BEAUTY
});

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
