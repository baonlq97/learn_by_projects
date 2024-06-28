import 'package:flutter_clean_architecture_bloc/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/image.dart';
part 'the_cat_api_service.g.dart';

@RestApi(baseUrl: theCatAPIBaseURL)
abstract class TheCatApiService {
  factory TheCatApiService(Dio dio) = _TheCatApiService;

  @GET('/images/search')
  Future<HttpResponse<List<ImageModel>>> getRandomImages({
    @Query('api-key') String? apiKey,
    @Query('limit') int? limit,
  });
}
