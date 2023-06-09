// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Download _$DownloadFromJson(Map<String, dynamic> json) => Download(
      cloudflare: json['Cloudflare'] as String?,
      get: json['Get'] as String?,
      ipfts: json['Ipfts'] as String?,
    );

Map<String, dynamic> _$DownloadToJson(Download instance) => <String, dynamic>{
      'Cloudflare': instance.cloudflare,
      'Get': instance.get,
      'Ipfts': instance.ipfts,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['ID'] as String?,
      author: json['Author'] as String?,
      title: json['Title'] as String?,
      pages: json['Pages'] as String?,
      publisher: json['Publisher'] as String?,
      size: json['Size'] as String?,
      year: json['Year'] as String?,
      extension: json['Extension'] as String?,
      language: json['Language'] as String?,
      mirror_1: json['Mirror_1'] as String?,
      mirror_2: json['Mirror_2'] as String?,
      mirror_3: json['Mirror_3'] as String?,
      mirror_4: json['Mirror_4'] as String?,
      mirror_5: json['Mirror_5'] as String?,
      edit: json['Edit'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'ID': instance.id,
      'Author': instance.author,
      'Title': instance.title,
      'Publisher': instance.publisher,
      'Year': instance.year,
      'Pages': instance.pages,
      'Language': instance.language,
      'Size': instance.size,
      'Extension': instance.extension,
      'Mirror_1': instance.mirror_1,
      'Mirror_2': instance.mirror_2,
      'Mirror_3': instance.mirror_3,
      'Mirror_4': instance.mirror_4,
      'Mirror_5': instance.mirror_5,
      'Edit': instance.edit,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      id: json['ID'] as String?,
      author: json['Author'] as String?,
      title: json['Title'] as String?,
      publisher: json['Publisher'] as String?,
      year: json['Year'] as String?,
      pages: json['Pages'] as String?,
      language: json['Language'] as String?,
      size: json['Size'] as String?,
      extension: json['Extension'] as String?,
      mirror_1: json['Mirror_1'] as String?,
      mirror_2: json['Mirror_2'] as String?,
      mirror_3: json['Mirror_3'] as String?,
      mirror_4: json['Mirror_4'] as String?,
      mirror_5: json['Mirror_5'] as String?,
      edit: json['Edit'] as String?,
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.id);
  writeNotNull('Author', instance.author);
  writeNotNull('Title', instance.title);
  writeNotNull('Publisher', instance.publisher);
  writeNotNull('Year', instance.year);
  writeNotNull('Pages', instance.pages);
  writeNotNull('Language', instance.language);
  writeNotNull('Size', instance.size);
  writeNotNull('Extension', instance.extension);
  writeNotNull('Mirror_1', instance.mirror_1);
  writeNotNull('Mirror_2', instance.mirror_2);
  writeNotNull('Mirror_3', instance.mirror_3);
  writeNotNull('Mirror_4', instance.mirror_4);
  writeNotNull('Mirror_5', instance.mirror_5);
  writeNotNull('Edit', instance.edit);
  return val;
}

BookView _$BookViewFromJson(Map<String, dynamic> json) => BookView(
      book: Book.fromJson(json['Book'] as Map<String, dynamic>),
      date: DateTime.parse(json['Date'] as String),
    );

Map<String, dynamic> _$BookViewToJson(BookView instance) => <String, dynamic>{
      'Book': instance.book,
      'Date': instance.date.toIso8601String(),
    };
