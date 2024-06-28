part of 'remote_images_bloc.dart';

sealed class RemoteImagesEvent extends Equatable {
  const RemoteImagesEvent();

  @override
  List<Object> get props => [];
}

class GetImages extends RemoteImagesEvent {
  const GetImages();
}
