part of 'local_images_bloc.dart';

sealed class LocalImagesState extends Equatable {
  final List<ImageEntity>? images;

  const LocalImagesState({this.images});

  @override
  List<Object> get props => [images ?? []];
}

final class LocalImagesLoading extends LocalImagesState {
  const LocalImagesLoading();
}

final class LocalImagesDone extends LocalImagesState {
  const LocalImagesDone(List<ImageEntity> images) : super(images: images);
}

final class LocalImageSaveSuccessfully extends LocalImagesState {
  const LocalImageSaveSuccessfully(List<ImageEntity> images) : super(images: images);
}

final class LocalImageDeleteSuccessfully extends LocalImagesState {
  const LocalImageDeleteSuccessfully(List<ImageEntity> images) : super(images: images);
}
