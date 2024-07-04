import 'package:floor/floor.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/models/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';

@dao
abstract class ImageDao {
  @Insert()
  Future<void> insertImage(ImageModel image);

  @delete
  Future<void> deleteImage(ImageModel image);

  @Query("SELECT * FROM images")
  Future<List<ImageModel>> getImages();
}