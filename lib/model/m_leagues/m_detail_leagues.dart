import 'dart:convert';

ModelDetailLeagues modelDetailLeaguesFromJson(String str) =>
    ModelDetailLeagues.fromJson(json.decode(str));

String modelDetailLeaguesToJson(ModelDetailLeagues data) =>
    json.encode(data.toJson());

class ModelDetailLeagues {
  ModelDetailLeagues({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory ModelDetailLeagues.fromJson(Map<String, dynamic> json) =>
      ModelDetailLeagues(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
