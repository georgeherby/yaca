import 'dart:async';
import 'dart:io';

import 'package:crypto_app/old/data/dao/favourites_dao.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "crypto_app.db";
  static final _databaseVersion = 1;

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory? documentsDirectory = await getApplicationDocumentsDirectory();

    if (documentsDirectory != null) {
      String path = join(documentsDirectory.path, _databaseName);
      return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
    } else {
      throw Exception("No documentsDirectory found when initing database");
    }
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${FavouritesDao.TABLE_NAME} (
            ${FavouritesDao.COLUMN_ID} INTEGER PRIMARY KEY,
            ${FavouritesDao.COLUMN_NAME} TEXT NOT NULL,
            ${FavouritesDao.COLUMN_SYMBOL} TEXT NOT NULL,
            CONSTRAINT unq UNIQUE (${FavouritesDao.COLUMN_NAME}, ${FavouritesDao.COLUMN_SYMBOL})
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String tableName, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(String tableName, Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[FavouritesDao.COLUMN_ID];
    return await db
        .update(tableName, row, where: '${FavouritesDao.COLUMN_ID} = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(String tableName, int id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '${FavouritesDao.COLUMN_ID} = ?', whereArgs: [id]);
  }
}
