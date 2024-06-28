import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_bloc/config/routes/app_routes.dart';
import 'package:flutter_clean_architecture_bloc/config/theme/app_themes.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/bloc/image/remote/remote_images_bloc.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/pages/home/random_images.dart';
import 'package:flutter_clean_architecture_bloc/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteImagesBloc>(
      create: (context) => sl()..add(GetImages()),
      child: MaterialApp(
          theme: theme(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const RandomImages()),
    );
  }
}
