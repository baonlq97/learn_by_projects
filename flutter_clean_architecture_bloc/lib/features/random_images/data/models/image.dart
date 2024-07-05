import 'package:floor/floor.dart';
import 'breed.dart';
import '../../domain/entities/image.dart';


@Entity(tableName: 'images', primaryKeys: ['id'])
class ImageModel extends ImageEntity {
  ImageModel({
    required super.id,
    required super.url,
    required super.width,
    required super.height,
    required super.breeds,
  });

  factory ImageModel.fromEntity(ImageEntity entity) {
    return ImageModel(
      id: entity.id,
      url: entity.url,
      width: entity.width,
      height: entity.height,
      breeds: entity.breeds,
    );
  }

  ImageEntity toEntity() {
    return ImageEntity(
      id: id,
      url: url,
      width: width,
      height: height,
      breeds: breeds!.map((breed) => (breed as BreedModel).toEntity()).toList(),
    );
  }
}
