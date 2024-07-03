// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ImageDao? _imageDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `images` (`id` TEXT, `url` TEXT, `width` INTEGER, `height` INTEGER, `breeds` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ImageDao get imageDao {
    return _imageDaoInstance ??= _$ImageDao(database, changeListener);
  }
}

class _$ImageDao extends ImageDao {
  _$ImageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _imageModelInsertionAdapter = InsertionAdapter(
            database,
            'images',
            (ImageModel item) => <String, Object?>{
                  'id': item.id,
                  'url': item.url,
                  'width': item.width,
                  'height': item.height,
                  'breeds': _imageConverter.encode(item.breeds)
                }),
        _imageModelDeletionAdapter = DeletionAdapter(
            database,
            'images',
            ['id'],
            (ImageModel item) => <String, Object?>{
                  'id': item.id,
                  'url': item.url,
                  'width': item.width,
                  'height': item.height,
                  'breeds': _imageConverter.encode(item.breeds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ImageModel> _imageModelInsertionAdapter;

  final DeletionAdapter<ImageModel> _imageModelDeletionAdapter;

  @override
  Future<List<ImageModel>> getImages() async {
    return _queryAdapter.queryList('SELECT * FROM image',
        mapper: (Map<String, Object?> row) => ImageModel(
            id: row['id'] as String?,
            url: row['url'] as String?,
            width: row['width'] as int?,
            height: row['height'] as int?,
            breeds: _imageConverter.decode(row['breeds'] as String)));
  }

  @override
  Future<void> insertImage(ImageModel image) async {
    await _imageModelInsertionAdapter.insert(image, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteImage(ImageModel image) async {
    await _imageModelDeletionAdapter.delete(image);
  }
}

// ignore_for_file: unused_element
final _imageConverter = ImageConverter();
