import 'dart:async';
import 'package:flutter_clean_architecture_bloc/features/random_images/domain/entities/image.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'DAO/image_dao.dart';
import 'image_converter.dart';
import '../../models/image.dart';

part 'app_database.g.dart';

@TypeConverters([ImageConverter])
@Database(version: 1, entities: [ImageModel])
abstract class AppDatabase extends FloorDatabase {
  ImageDao get imageDao;
}