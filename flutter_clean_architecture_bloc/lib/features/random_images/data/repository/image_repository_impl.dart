// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_bloc/core/constants/constants.dart';
import 'package:flutter_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_bloc/env/env.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/data_sources/remote/the_cat_api_service.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/models/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final TheCatApiService _theCatApiService;

  ImageRepositoryImpl(this._theCatApiService);

  @override
  Future<DataState<List<ImageModel>>> getRandomImages() async {
    try {
      final httpResponse = await _theCatApiService.getRandomImages(
        apiKey: Env.theCatApiKey,
        limit: limitImage
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions
          )
        );
      }
    } on DioException catch(ex) {
      return DataFailed(ex);
    }
  }
}
