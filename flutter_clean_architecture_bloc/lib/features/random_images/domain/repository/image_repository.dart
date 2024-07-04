import '../../../../core/resources/data_state.dart';
import '../entities/image.dart';

abstract class ImageRepository {
  Future<DataState<List<ImageEntity>>> getRandomImages();

  Future<List<ImageEntity>> getSavedImages();

  Future<void> saveImage(ImageEntity entity);

  Future<void> removeImage(ImageEntity entity);
}