import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Download {
  final String? cloudflare;
  final String? get;
  final String? ipfts;

  const Download({this.cloudflare, this.get, this.ipfts});

  factory Download.fromJson(Map<String, dynamic> json) =>
      _$DownloadFromJson(json);
  Map<String, dynamic> toJson() => _$DownloadToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Book {
  @JsonKey(name: 'ID')
  final String? id;
  final String? author;
  final String? title;
  final String? publisher;
  final String? year;
  final String? pages;
  final String? language;
  final String? size;
  final String? extension;
  final String? mirror_1;
  final String? mirror_2;
  final String? mirror_3;
  final String? mirror_4;
  final String? mirror_5;
  final String? edit;

  Book({
    this.id,
    this.author,
    this.title,
    this.pages,
    this.publisher,
    this.size,
    this.year,
    this.extension,
    this.language,
    this.mirror_1,
    this.mirror_2,
    this.mirror_3,
    this.mirror_4,
    this.mirror_5,
    this.edit,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Filters {
  @JsonKey(name: 'ID')
  final String? id;
  final String? author;
  final String? title;
  final String? publisher;
  final String? year;
  final String? pages;
  final String? language;
  final String? size;
  final String? extension;
  final String? mirror_1;
  final String? mirror_2;
  final String? mirror_3;
  final String? mirror_4;
  final String? mirror_5;
  final String? edit;

  const Filters(
      {this.id,
      this.author,
      this.title,
      this.publisher,
      this.year,
      this.pages,
      this.language,
      this.size,
      this.extension,
      this.mirror_1,
      this.mirror_2,
      this.mirror_3,
      this.mirror_4,
      this.mirror_5,
      this.edit});

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class BookView {
  final Book book;
  final DateTime date;

  const BookView({required this.book, required this.date});

  factory BookView.fromJson(Map<String, dynamic> json) =>
      _$BookViewFromJson(json);
  Map<String, dynamic> toJson() => _$BookViewToJson(this);
}
