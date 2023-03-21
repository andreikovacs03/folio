// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'libgen_api.dart';

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
      id: json['ID'] as String,
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
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'ID': instance.id,
      'Author': instance.author,
      'Title': instance.title,
      'Pages': instance.pages,
      'Publisher': instance.publisher,
      'Size': instance.size,
      'Year': instance.year,
      'Extension': instance.extension,
      'Language': instance.language,
      'Mirror_1': instance.mirror_1,
      'Mirror_2': instance.mirror_2,
      'Mirror_3': instance.mirror_3,
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

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
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

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LibgenAPI implements LibgenAPI {
  _LibgenAPI(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://folio-extensions.vercel.app/libgen/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Book>> searchTitle(title) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Book>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/search_title/{title}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Book.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Book>> searchTitleFiltered(
    title,
    filters,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(filters.toJson());
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Book>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/search_title_filtered/{title}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Book.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<Download> download(url) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Download>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/download/{url}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Download.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
