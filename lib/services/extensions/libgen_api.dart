import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'book.dart';
import 'download.dart';

@lazySingleton
class LibgenAPI {
  late Dio dio =
      Dio(BaseOptions(baseUrl: 'https://folio-extensions.vercel.app/libgen'));

  Future<Book?> searchTitle(String title) async {
    final response = await dio.get<Book>('/search_title/$title');

    return response.data;
  }

  Future<Download?> download(String url) async {
    final response = await dio.get<Download>('/download/$url');

    return response.data;
  }
}
