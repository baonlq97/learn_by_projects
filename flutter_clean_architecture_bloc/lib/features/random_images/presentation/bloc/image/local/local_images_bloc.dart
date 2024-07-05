// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/delete_image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/get_saved_images.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/save_image.dart';

part 'local_images_event.dart';
part 'local_images_state.dart';

class LocalImagesBloc extends Bloc<LocalImagesEvent, LocalImagesState> {
  final GetSavedImagesUseCase _getSavedImagesUseCase;
  final SaveImageUseCase _saveImageUseCase;
  final DeleteImageUseCase _deleteImageUseCase;

  LocalImagesBloc(
    this._getSavedImagesUseCase,
    this._saveImageUseCase,
    this._deleteImageUseCase,
  ) : super(const LocalImagesLoading()) {
    on<GetSavedImages>(onGetSavedImages);
    on<SaveImage>(onSaveImage);
    on<DeleteImage>(onDeleteImage);
  }

  void onGetSavedImages(
      GetSavedImages event, Emitter<LocalImagesState> emit) async {
    final images = await _getSavedImagesUseCase();
    emit(LocalImagesDone(images));
  }

  void onSaveImage(SaveImage saveImage, Emitter<LocalImagesState> emit) async {
    await _saveImageUseCase(params: saveImage.entity);
    final images = await _getSavedImagesUseCase();
    emit(LocalImageSaveSuccessfully(images));
  }

  void onDeleteImage(DeleteImage deleteImage, Emitter<LocalImagesState> emit) async {
    await _deleteImageUseCase(params: deleteImage.entity);
    final images = await _getSavedImagesUseCase();
    emit(LocalImageDeleteSuccessfully(images));
  }
}
