// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architecture_bloc/core/resources/data_state.dart';
import 'package:flutter_clean_architecture_bloc/core/usecase/usecase.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';

class GetImageUseCase implements Usecase<DataState<List<ImageEntity>>, void> {
  ImageRepository _imageRepository;

  GetImageUseCase(this._imageRepository);
  
  @override
  Future<DataState<List<ImageEntity>>> call({void params}) {
    return _imageRepository.getRandomImages();
  }
}
