import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'libgen_api_v2.g.dart';

@RestApi(baseUrl: 'http://gen.lib.rus.ec/')
abstract class LibgenAPI2 {
  factory LibgenAPI2(Dio dio, {String baseUrl}) = _LibgenAPI2;

  @GET("search.php")
  Future<String> search(
      @Query('req') String req,
      @Query('open') int? open,
      @Query('res') int? res,
      @Query('view') String? view,
      @Query('phase') String? phase,
      @Query('column') String? column);
}
