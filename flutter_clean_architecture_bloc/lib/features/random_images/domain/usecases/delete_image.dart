import '../../../../core/usecase/usecase.dart';
import '../entities/image.dart';
import '../repository/image_repository.dart';

class DeleteImageUseCase extends Usecase<void, ImageEntity> {
  final ImageRepository _imageRepository;

  DeleteImageUseCase(this._imageRepository);
  @override
  Future<void> call({ImageEntity? params}) {
    return _imageRepository.removeImage(params!);
  }

}