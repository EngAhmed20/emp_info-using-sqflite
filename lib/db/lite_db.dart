import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LiteDb {
  static Database? _database;
  Future<Database?> get getInstance async {
    if (_database == null) {
      _database = await init();
      return _database;
    } else {
      return _database;
    }
  }

  init() async {
    var datapathPath = await getDatabasesPath();
    String path = join(datapathPath, 'empdb.db');
    Database database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE EMPLOYEE (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        salary REAL NOT NULL,
        gender TEXT NOT NULL,
        status TEXT NOT NULL,
        hiring TEXT NOT NULL,
        position TEXT NOT NULL)
        ''');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (newVersion >= 2) {
        await db.execute('''
            ALTER TABLE EMPLOYEE ADD COLUMN phone TEXT NULL;
            
            
            ''');
      }
    });
    print('database created');
    return database;
  }

  inquery(String sqlText) async {
    Database? db = await getInstance;
    List<Map> list = await db!.rawQuery(sqlText);
    return list;
  }

  insert(String sqlText) async {
    Database? db = await getInstance;
    int count = await db!.rawInsert(sqlText);
    return count;
  }

  update(String sqlText) async {
    Database? db = await getInstance;
    int count = await db!.rawUpdate(sqlText);
    return count;
  }

  delete(String sqlText) async {
    Database? db = await getInstance;
    int count = await db!.rawDelete(sqlText);
    return count;
  }
}
