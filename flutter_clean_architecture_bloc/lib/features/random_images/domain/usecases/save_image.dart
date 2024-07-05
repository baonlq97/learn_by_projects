import '../../../../core/usecase/usecase.dart';
import '../entities/image.dart';
import '../repository/image_repository.dart';

class SaveImageUseCase extends Usecase<void, ImageEntity> {
  final ImageRepository _imageRepository;

  SaveImageUseCase(this._imageRepository);
  @override
  Future<void> call({ImageEntity? params}) {
    return _imageRepository.saveImage(params!);
  }

}