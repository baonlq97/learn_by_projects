import 'dart:async';
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