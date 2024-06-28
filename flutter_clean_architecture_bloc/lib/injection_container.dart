import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/data_sources/remote/the_cat_api_service.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/repository/image_repository_impl.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/repository/image_repository.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/get_image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<Dio>(Dio());
  
  sl.registerSingleton<TheCatApiService>(
    TheCatApiService(sl())
  );

  sl.registerSingleton<ImageRepository>(
    ImageRepositoryImpl(sl())
  );

  sl.registerSingleton<GetImageUseCase>(
    GetImageUseCase(sl())
  );

  sl.registerFactory<RemoteImagesBloc>(
    () => RemoteImagesBloc(sl())
  );
}