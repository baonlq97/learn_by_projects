part of 'remote_images_bloc.dart';

sealed class RemoteImagesState extends Equatable {
  final List<ImageEntity>? images;
  final DioException? dioException;

  const RemoteImagesState({this.images, this.dioException});

  @override
  List<Object> get props => [images!, dioException!];
}

final class RemoteImagesLoading extends RemoteImagesState {
  const RemoteImagesLoading();
}

final class RemoteImagesDone extends RemoteImagesState {
  const RemoteImagesDone(List<ImageEntity> images) : super(images: images);
}

final class RemoteImagesError extends RemoteImagesState {
  const RemoteImagesError(DioException dioException) : super(dioException: dioException);
}
