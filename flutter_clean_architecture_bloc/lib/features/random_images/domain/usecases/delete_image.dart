import 'package:flutter_clean_architecture_bloc/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';

class DeleteImageUseCase extends Usecase<void, ImageEntity> {
  final ImageRepository _imageRepository;

  DeleteImageUseCase(this._imageRepository);
  @override
  Future<void> call({ImageEntity? params}) {
    return _imageRepository.removeImage(params!);
  }

}