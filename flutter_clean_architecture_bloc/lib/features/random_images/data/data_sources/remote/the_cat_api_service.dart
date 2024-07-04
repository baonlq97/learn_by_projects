import '../../../../../core/constants/constants.dart';
import '../../../domain/entities/image.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/image.dart';
part 'the_cat_api_service.g.dart';

@RestApi(baseUrl: theCatAPIBaseURL)
abstract class TheCatApiService {
  factory TheCatApiService(Dio dio) = _TheCatApiService;

  @GET('/images/search')
  Future<HttpResponse<List<ImageEntity>>> getRandomImages({
    @Query('api_key') String? apiKey,
    @Query('limit') int? limit,
    @Query('has_breeds') bool? hasBreeds
  });
}
