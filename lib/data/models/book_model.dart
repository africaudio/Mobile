import 'dart:convert';

BookModel bookModelFromMap(String str) => BookModel.fromMap(json.decode(str));

String bookModelToMap(BookModel data) => json.encode(data.toMap());

class BookModel {
  final String id;
  final String title;
  final String author;
  final String narrator;
  final DateTime releaseDate;
  final String language;
  final String publisher;
  final List<String> categories;
  final List<dynamic> reviews;
  final List<Chapter> chapters;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String audioSampleUrl;
  final String coverImageUrl;
  final String description;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.narrator,
    required this.releaseDate,
    required this.language,
    required this.publisher,
    required this.categories,
    required this.reviews,
    required this.chapters,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.audioSampleUrl,
    required this.coverImageUrl,
    required this.description,
  });

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
        id: json["_id"],
        title: json["title"],
        author: json["author"],
        narrator: json["narrator"],
        releaseDate: DateTime.parse(json["release_date"]),
        language: json["language"],
        publisher: json["publisher"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        chapters:
            List<Chapter>.from(json["chapters"].map((x) => Chapter.fromMap(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        audioSampleUrl: json["audio_sample_url"],
        coverImageUrl: json["cover_image_url"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "author": author,
        "narrator": narrator,
        "release_date": releaseDate.toIso8601String(),
        "language": language,
        "publisher": publisher,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "chapters": List<dynamic>.from(chapters.map((x) => x.toMap())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "audio_sample_url": audioSampleUrl,
        "cover_image_url": coverImageUrl,
        "description": description,
      };
}

class Chapter {
  final String title;
  final int length;
  final String file;
  final String description;
  final String id;

  Chapter({
    required this.title,
    required this.length,
    required this.file,
    required this.description,
    required this.id,
  });

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        title: json["title"],
        length: json["length"],
        file: json["file"],
        description: json["description"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "length": length,
        "file": file,
        "description": description,
        "_id": id,
      };
}
