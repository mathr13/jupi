import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelperProjects {

  static DatabaseHelperProjects _databaseHelper;
  static Database _database;

  DatabaseHelperProjects._createInstance();

  factory DatabaseHelperProjects() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelperProjects._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'stringing.db';
    print(path);

    var stringingDatabase = await openDatabase(path, version: 1);
    return stringingDatabase;
  }

  Future<void> createTable(String tableName, String columnName, String columnDataType) async {
    Database db = await this.database;
    await db.execute('CREATE TABLE $tableName($columnName $columnDataType)');
  }
  Future<void> addColumnToTable(String tableName, String columnName, String columnDataType) async {
    Database db = await this.database;
    await db.execute('ALTER TABLE $tableName ADD $columnName $columnDataType;');
  }
}