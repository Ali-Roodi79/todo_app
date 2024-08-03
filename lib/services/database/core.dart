import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CoreDatabase {
  Future<Database> database() async {
    return openDatabase(join(await getDatabasesPath(), 'tasko.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT NOT NULL ,description TEXT)");
      await db.execute(
          "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,task_id INTEGER NOT NULl , title TEXT NOT NULL ,isDone INTEGER NOT NULL)");
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await db.execute(
            "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,task_id INTEGER NOT NULl , title TEXT NOT NULL ,isDone INTEGER NOT NULL)");
      }
    }, version: 3);
  }
}
