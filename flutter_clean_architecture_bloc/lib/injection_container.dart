import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/data/data_sources/local/app_database.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/delete_image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/get_saved_images.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/usecases/save_image.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/local/local_images_bloc.dart';
import 'features/random_images/data/data_sources/remote/the_cat_api_service.dart';
import 'features/random_images/data/repository/image_repository_impl.dart';
import 'features/random_images/domain/repository/image_repository.dart';
import 'features/random_images/domain/usecases/get_image.dart';
import 'features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<Dio>(Dio());
  
  sl.registerSingleton<TheCatApiService>(
    TheCatApiService(sl())
  );

  sl.registerSingleton<ImageRepository>(
    ImageRepositoryImpl(sl(), sl())
  );

  sl.registerSingleton<GetImageUseCase>(
    GetImageUseCase(sl())
  );

  sl.registerSingleton<GetSavedImagesUseCase>(
    GetSavedImagesUseCase(sl())
  );

  sl.registerSingleton<SaveImageUseCase>(
    SaveImageUseCase(sl())
  );

  sl.registerSingleton<DeleteImageUseCase>(
    DeleteImageUseCase(sl())
  );

  sl.registerFactory<RemoteImagesBloc>(
    () => RemoteImagesBloc(sl())
  );

  sl.registerFactory<LocalImagesBloc>(
    () => LocalImagesBloc(sl(), sl(), sl())
  );
}