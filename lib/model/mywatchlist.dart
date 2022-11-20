import 'dart:convert';

List<MyWatchList> myWatchListFromJson(String str) => List<MyWatchList>.from(
    json.decode(str).map((x) => MyWatchList.fromJson(x)));

String myWatchListToJson(List<MyWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchList {
  MyWatchList({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model model;
  int pk;
  Fields fields;

  factory MyWatchList.fromJson(Map<String, dynamic> json) => MyWatchList(
    model: modelValues.map[json["model"]]!,
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": modelValues.reverse[model],
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.title,
    required this.release_date,
    required this.watched,
    required this.rating,
    required this.review,
  });

  String title;
  String release_date;
  String watched;
  int rating;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    title: json["title"],
    release_date: json["release_date"],
    watched: json["watched"],
    rating: json["rating"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "release_date": release_date,
    "watched": watched,
    "rating": rating,
    "review": review,
  };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues =
EnumValues(map: {"mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues({required this.map});

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
