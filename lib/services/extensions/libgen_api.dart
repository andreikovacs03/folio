import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models.dart';

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
