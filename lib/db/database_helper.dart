import 'package:kost_z/models/kost_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper.internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper.internal();
  static const String _tableFavorite = 'tableFavorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/kostz.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableFavorite (
            id TEXT PRIMARY KEY,
            nama TEXT,
            lokasi TEXT,
            deskripsi TEXT,
            thumbnail TEXT,
            maps TEXT,
            no_hp TEXT,
            rating TEXT,
            fasilitas TEXT,
            photo TEXT,
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }
    return _database;
  }

  Future<List<Kosan>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tableFavorite);

    return results.map((res) => Kosan.fromJson(res)).toList();
  }

  Future<Map> getFavoriteById(int id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tableFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> insertFavorite(Kosan kost) async {
    final db = await database;
    await db!.insert(_tableFavorite, kost.toJson());
  }

  Future<void> removeFavorite(int id) async {
    final db = await database;

    await db!.delete(_tableFavorite, where: 'id = ?', whereArgs: [id]);
  }
}
