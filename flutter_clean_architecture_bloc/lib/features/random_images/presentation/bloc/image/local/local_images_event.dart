part of 'local_images_bloc.dart';

sealed class LocalImagesEvent extends Equatable {
  final ImageEntity? entity;
  const LocalImagesEvent({this.entity});

  @override
  List<Object> get props => [entity!];
}

class GetSavedImages extends LocalImagesEvent {
  const GetSavedImages();
}

class SaveImage extends LocalImagesEvent {
  const SaveImage(ImageEntity entity) : super(entity: entity);
}

class DeleteImage extends LocalImagesEvent {
  const DeleteImage(ImageEntity entity) : super(entity: entity);
}