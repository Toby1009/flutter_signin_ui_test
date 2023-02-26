import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DBHelper{
  static  Database? _db;

  ///get DataBase if null ,init DataBase
  Future<Database> get db async{
    if(_db != null){
      return _db!;
    }
    _db = await initDataBase();
    return _db!;
  }
  ///init DataBase
  initDataBase()async{

    //get app documents directory
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();

    //get directory path
    String path = join(documentDirectory.path,'user.db');

    //open document and create table
    var db = openDatabase(path,version: 1,onCreate: _onCreate);
    return db;
  }

  //create table
  _onCreate(Database db,int version){
    db.execute("CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, email TEXT, password Text)");
  }
}