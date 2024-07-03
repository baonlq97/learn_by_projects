import 'breed_mapper_extension.dart';
import '../../../features/random_images/data/models/image.dart';
import '../../../features/random_images/domain/entities/image.dart';

extension ImageModelMapper on ImageModel {
  ImageEntity toEntity() {
    return ImageEntity(
        id: id,
        url: url,
        width: width,
        height: height,
        breeds: breeds!.map((breed) => breed.toEntity()).toList());
  }
}

extension ImageEntityMapper on ImageEntity {
  ImageModel toModel() {
    return ImageModel(
      id: id,
      url: url,
      breeds: breeds!.map((breed) => breed.toModel()).toList(),
    );
  }
}
