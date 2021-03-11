import 'dart:convert';

ModelListLeagues modelListLeaguesFromJson(String str) =>
    ModelListLeagues.fromJson(json.decode(str));

String modelListLeaguesToJson(ModelListLeagues data) =>
    json.encode(data.toJson());

class ModelListLeagues {
  ModelListLeagues({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory ModelListLeagues.fromJson(Map<String, dynamic> json) =>
      ModelListLeagues(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.slug,
    this.abbr,
    this.logos,
  });

  String id;
  String name;
  String slug;
  String abbr;
  Logos logos;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        abbr: json["abbr"],
        logos: Logos.fromJson(json["logos"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "abbr": abbr,
        "logos": logos.toJson(),
      };
}

class Logos {
  Logos({
    this.light,
    this.dark,
  });

  String light;
  String dark;

  factory Logos.fromJson(Map<String, dynamic> json) => Logos(
        light: json["light"],
        dark: json["dark"],
      );

  Map<String, dynamic> toJson() => {
        "light": light,
        "dark": dark,
      };
}
