import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'libgen_api.g.dart';

@RestApi(baseUrl: 'https://folio-extensions.vercel.app/libgen/')
abstract class LibgenAPI {
  factory LibgenAPI(Dio dio, {String baseUrl}) = _LibgenAPI;

  @GET("/search_title/{title}")
  Future<List<Book>> searchTitle(@Path("title") String title);

  @POST("/search_title_filtered/{title}")
  Future<List<Book>> searchTitleFiltered(
      @Path("title") String title, @Body() Filters filters);

  @POST("/download/")
  @FormUrlEncoded()
  Future<Download> download(@Field() String link);
}

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
  final String id;
  final String? author;
  final String? title;
  final String? pages;
  final String? publisher;
  final String? size;
  final String? year;
  final String? extension;
  final String? language;
  final String? mirror_1;
  final String? mirror_2;
  final String? mirror_3;

  const Book(
      {required this.id,
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
      this.mirror_3});

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
