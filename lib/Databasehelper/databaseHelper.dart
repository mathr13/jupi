import 'dart:async';
import 'dart:io' as io;
import 'package:jupiter/Constant/string_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance=new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db=await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    // io.Directory documentsDirectory=await getApplicationDocumentsDirectory();
    String documentsDirectory=await getDatabasesPath();
    String path=join(documentsDirectory, systemDb);
    print("------------------------***DATABASE***------------------------");
    print(path);
    var theDb=await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE USER(userName TEXT, firstName TEXT, lastName TEXT, userId NUMBER, lang TEXT, PRIMARY KEY(userId))");
    await db.execute("CREATE TABLE NotificationQueue(queueId TEXT ,projectId NUMBER,category TEXT ,message TEXT ,type TEXT ,seqNo NUMBER,groupSeqNo NUMBER, timestamp NUMBER,status TEXT, uri TEXT, params TEXT,PRIMARY KEY(queueId,projectId))");
    await db.execute("CREATE TABLE PROJECT(projectName TEXT, projectId NUMBER, init BOOL, defaultProject BOOL, db TEXT,PRIMARY KEY(projectId))");
    await db.execute("CREATE TABLE MENU(menuIndex NUMBER,projectId NUMBER, menuId TEXT, menuURL TEXT, perm TEXT, menus TEXT,PRIMARY KEY(menuId,projectId))");
    await db.execute("CREATE TABLE PERMISSION(permissionId TEXT, projectId NUMBER,PRIMARY KEY(projectId,permissionId))");
    await db.execute("CREATE TABLE GLOBALVARIABLE(projectId NUMBER, key TEXT, value TEXT)");
    await db.execute("CREATE TABLE LABEL(key TEXT, value TEXT, localization TEXT, projectId NUMBER, appType TEXT,PRIMARY KEY(projectId,key,localization))");
    await db.execute("CREATE TABLE system_tables_info(tableId NUMBER, tableName TEXT, status BOOLEAN,PRIMARY KEY(tableId))");
    await db.execute("INSERT INTO system_tables_info(tableId, tableName) VALUES(1,'USER'),(2,'NotificationQueue'),(3,'PROJECT'),(4,'MENU'),(5,'PERMISSION'),(6,'GLOBALVARIABLE'),(7,'LABEL')");
    await db.execute("CREATE TABLE FORMS(formId TEXT, name TEXT, templates TEXT)");
  }

  Future<void> populateTableWithMapping(String tableName, Map<String, dynamic> value) async {
    var dbClient=await db;
    await dbClient.insert(tableName, value,conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<void> populateTableWithCustomColumn(String tableName, Map<String, dynamic> value,String columnName,dynamic columnValue) async {
    var dbClient = await db;
    value.putIfAbsent("$columnName", () => columnValue);
    await dbClient.insert(tableName, value,conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map>> checkIfNotificationReceived(String tableName) async {
    var dbClient = await db;
    return await dbClient.rawQuery("SELECT * FROM $tableName");
  }

  // Future<int> checkForDefaultProject(String tableName) async {
  //   var dbClient=await db;
  //   List<Map> res=await dbClient.rawQuery(
  //       "SELECT projectId FROM $tableName WHERE defaultProject == 1");
  //   return Future.value(res[0]["projectId"]);
  // }
  Future<int> checkForDefaultProject() async {
    var dbClient=await db;
    List<Map> res=await dbClient.rawQuery("SELECT projectId FROM PROJECT WHERE defaultProject = 1");
    if(res.isEmpty) {res=await dbClient.rawQuery("SELECT projectId FROM PROJECT");}
    return Future.value(res[0]["projectId"]);
  }

  Future<void> updateColumn(String tableName, String columnName, dynamic columnValue) async {
    var dbClient = await db;
    await dbClient.rawQuery("UPDATE  $tableName SET '$columnName' = '$columnValue'");
  }

  Future<List> fetchMenuData() async {
    var dbClient=await db;
    // await dbClient.rawQuery("UPDATE Menu SET urlUrl = 'Icon' ");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int defualtProjectId = sharedPreferences.getInt('projectId');
    var res=await dbClient.rawQuery("SELECT value FROM LABEL WHERE key IN (SELECT menuId FROM MENU)");
    return res.toList();
  }

  Future<List> fetchTablesData() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT tableName FROM system_tables_info WHERE tableName IS NOT NULL");
    return res.toList();
  }

  Future<List<dynamic>> sortingNotificationData() async {
    var dbClient=await db;
    List<dynamic> res = await dbClient.rawQuery('SELECT * FROM NotificationQueue WHERE type = "BO" AND category = "INIT" AND status = "ACTIVE" AND projectId = -1 ORDER BY groupSeqNo, seqNo ASC');
    return res;
  }

  Future<List<dynamic>> getProjectIdFromNotificationData() async {
    var dbClient=await db;
    List<dynamic> res = await dbClient.rawQuery('SELECT * FROM NotificationQueue WHERE projectId = -1');
    return res;
  }

  Future<List<dynamic>> fetchInitNotificationRecords() async {
    var dbClient=await db;
    List<dynamic> res = await dbClient.rawQuery('SELECT * from NotificationQueue WHERE projectId in (SELECT projectId FROM PROJECT WHERE init = 1) AND type = "BO" AND category = "INIT" AND status = "ACTIVE" ORDER BY groupSeqNo, seqNo ASC');
    return res.toList();
  }

  Future<List<dynamic>> fetchInitNotificationRecordsForDefaultProject() async {
    var dbClient=await db;
    List<dynamic> res = await dbClient.rawQuery('SELECT * from NotificationQueue WHERE projectId in (SELECT projectId FROM PROJECT WHERE defaultProject = 1) AND type = "BO" AND category = "INIT" AND status = "ACTIVE" ORDER BY groupSeqNo, seqNo ASC');
    return res.toList();
  }

  Future<List<dynamic>> fetchFirstProject() async {
    var dbClient=await db;
    List<dynamic> res = await dbClient.rawQuery('SELECT * FROM PROJECT LIMIT 1');
    return res.toList();
  }

  Future<int> checkLabelData() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM LABEL");
    return res.length;
  }

  // Future<List<Map>> getSystemTables() async {
  //   var dbClient = await db;
  //   return await dbClient.rawQuery("SELECT tableName FROM system_tables_info");
  // }

  //------------------------------------------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------------------------------------------
  //------------------------------------------------------------------------------------------------------------------------


  Future insert(Map<String, dynamic> map) async {
    var dbClient = await db;
    dbClient.rawQuery("DELETE FROM LOV");
    dbClient.insert("LOV", map);
  }


  Future insertInfo() async {
    var dbClient = await db;
    dbClient.rawInsert(
        "INSERT INTO Info (tableName,tableInfo) VALUES ('Projects','Sync')");
  }
  Future<List> fetchData(String table) async {
    var dbClient = await db;
    var data = await dbClient.rawQuery("SELECT * FROM '$table' ");
    return data.toList();
  }
  Future<List> count(String table) async {
    var dbClient = await db;
    var value = await dbClient.rawQuery("SELECT COUNT(1) FROM '$table' ");
    return value;
  }
}