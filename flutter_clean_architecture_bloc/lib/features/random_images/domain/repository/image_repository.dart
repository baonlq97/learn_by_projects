import '../../../../core/resources/data_state.dart';
import '../entities/image.dart';

abstract class ImageRepository {
  Future<DataState<List<ImageEntity>>> getRandomImages();
}