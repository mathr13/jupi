import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "render.db");
    print(path);
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE LOV (lovId TEXT,displayName TEXT,displayValue TEXT,type TEXT)");
  }
  Future  insert(Map<String,dynamic> map) async{
    var dbClient = await db;
    dbClient.insert("LOV", map);


}

  dynamic fetchData(dynamic type) async {
    var dbClient = await db;
    var data =  dbClient.rawQuery("SELECT * FROM LOV WHERE type LIKE '$type' ");
    return data;
  }

}
