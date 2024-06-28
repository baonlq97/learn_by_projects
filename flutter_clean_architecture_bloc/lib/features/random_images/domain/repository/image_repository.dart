import 'package:flutter_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';

abstract class ImageRepository {
  Future<DataState<List<ImageEntity>>> getRandomImages();
}