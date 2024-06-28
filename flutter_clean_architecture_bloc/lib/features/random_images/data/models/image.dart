import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';

class ImageModel extends ImageEntity {
  const ImageModel(
      {required super.id,
      required super.url,
      required super.width,
      required super.height});

  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
        id: map['id'],
        url: map['url'],
        width: map['width'],
        height: map['height']);
  }
}
