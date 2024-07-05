import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/random_images/presentation/bloc/image/local/local_images_bloc.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/app_themes.dart';
import 'features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'features/random_images/presentation/pages/home/random_images.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteImagesBloc>(
          create: (context) => sl<RemoteImagesBloc>()..add(const GetImages()),
        ),
        BlocProvider<LocalImagesBloc>(
          create: (context) => sl<LocalImagesBloc>(),
        ),
      ],
      child: MaterialApp(
          theme: theme(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const RandomImages()),
    );
  }
}
