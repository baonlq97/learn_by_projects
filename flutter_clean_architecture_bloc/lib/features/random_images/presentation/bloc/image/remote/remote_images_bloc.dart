import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../core/util/extensions/image_mapper_extension.dart';
import '../../../../data/models/image.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/entities/image.dart';
import '../../../../domain/usecases/get_image.dart';

part 'remote_images_event.dart';
part 'remote_images_state.dart';

class RemoteImagesBloc extends Bloc<RemoteImagesEvent, RemoteImagesState> {
  final GetImageUseCase _getImageUseCase;
  RemoteImagesBloc(this._getImageUseCase) : super(const RemoteImagesLoading()) {
    on<GetImages>(onGetImages);
  }

  void onGetImages(GetImages event, Emitter<RemoteImagesState> emit) async {
    final dataState = await _getImageUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteImagesDone(dataState.data!)
      );
    } 

    if (dataState is DataFailed) {
      emit(
        RemoteImagesError(dataState.error!)
      );
    }

  }
}
