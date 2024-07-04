import 'package:flutter_clean_architecture_bloc/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';

class SaveImageUseCase extends Usecase<void, ImageEntity> {
  final ImageRepository _imageRepository;

  SaveImageUseCase(this._imageRepository);
  @override
  Future<void> call({ImageEntity? params}) {
    return _imageRepository.saveImage(params!);
  }

}