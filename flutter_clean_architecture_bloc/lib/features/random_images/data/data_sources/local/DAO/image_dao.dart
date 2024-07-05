import 'package:floor/floor.dart';
import '../../../models/image.dart';

@dao
abstract class ImageDao {
  @Insert()
  Future<void> insertImage(ImageModel image);

  @delete
  Future<void> deleteImage(ImageModel image);

  @Query("SELECT * FROM images")
  Future<List<ImageModel>> getImages();
}