import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'article_schema.dart';

const dbName = "mercury.db";

class DatabaseProvider {
  static final DatabaseProvider instance = DatabaseProvider();
  Database _db;
  
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await createDatabase();
    return _db;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, dbName);

    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  Future onUpgrade(Database database, int oldVersion, int newVersion) async {
    print('oldVersion: $oldVersion, newVersion: $newVersion');
  }

  Future initDB(Database database, int version) async {
    await database.execute(articleCreateTableSql);
  }
}
