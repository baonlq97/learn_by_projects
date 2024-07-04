// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_bloc/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';

class GetSavedImagesUseCase extends Usecase<List<ImageEntity>, void> {
  final ImageRepository _imageRepository;
  GetSavedImagesUseCase(this._imageRepository);
  @override
  Future<List<ImageEntity>> call({void params}) {
    return _imageRepository.getSavedImages();
  }

}
