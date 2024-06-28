import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/pages/home/random_images.dart';
import 'package:flutter_clean_architecture_bloc/features/random_images/presentation/pages/saved_images/saved_images.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const RandomImages());
      case '/saved_images':
        return MaterialPageRoute(builder: (_) => const SavedImages());
      default:
        return MaterialPageRoute(builder: (_) => const RandomImages());
    }
  }
}