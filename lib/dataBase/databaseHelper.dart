// needed for Directory()
import 'dart:io';
// needed for join()
import 'package:path/path.dart';
// needed for SQL database operations
import 'package:sqflite/sqflite.dart';
// needed for getApplicationDocumentsDirectory()
import 'package:path_provider/path_provider.dart';

final String autoIncrementID = 'id';

// database table examiner
final String tableNews = 'news';
final String columnTitle = 'newsTitle';
final String columnSubtitle = 'newsSubtitle';
final String columnPhoto = 'newsPhoto';
final String columnDescription = 'newsDescription';

class NewsDB {
  int id;
  String newsTitle;
  String newsSubtitle;
  String newsPhoto;
  String newsDescription;

  NewsDB({
    this.id,
    this.newsTitle,
    this.newsSubtitle,
    this.newsPhoto,
    this.newsDescription,
  });

  // convenience constructor to create a Word object
  NewsDB.fromMap(Map<String, dynamic> map) {
    id = map[autoIncrementID];
    newsTitle = map[columnTitle];
    newsSubtitle = map[columnSubtitle];
    newsPhoto = map[columnPhoto];
    newsDescription = map[columnDescription];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      autoIncrementID: id,
      columnTitle: newsTitle,
      columnSubtitle: newsSubtitle,
      columnPhoto: newsPhoto,
      columnDescription: newsDescription,
    };

    if (autoIncrementID == null) {
      map[autoIncrementID] = id;
    }
    return map;
  }

  Map<String, dynamic> toJson() => {
        "newsTitle": newsTitle == null ? null : newsTitle,
        "newsSubtitle": newsSubtitle == null ? null : newsSubtitle,
        "newsPhoto": newsPhoto == null ? null : newsPhoto,
        "newsDescription": newsDescription == null ? null : newsDescription,
      };
}

// singleton class to manage the database
class DatabaseHelper {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "MyDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database, can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableNews (
        $autoIncrementID INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT NOT NULL,
        $columnSubtitle TEXT NOT NULL,
        $columnPhoto TEXT NOT NULL,
        $columnDescription TEXT NOT NULL
        
    )''');
  }

  Future<int> insertNews(NewsDB newsDB) async {
    Database db = await database;
    int id = await db.insert(tableNews, newsDB.toMap());
    return id;
  }

  Future<List<NewsDB>> getAllNews() async {
    Database db = await database;
    List<Map> maps = await db.query(tableNews, columns: [
      autoIncrementID,
      columnTitle,
      columnSubtitle,
      columnPhoto,
      columnDescription
    ]);

    if (maps.length > 0) {
      List<NewsDB> news = [];
      maps.forEach((map) => news.add(NewsDB.fromMap(map)));
      return news;
    }
    return null;
  }

  Future<List<Map>> queryNews(String id) async {
    Database db = await database;

    List<Map> maps = await db.query(tableNews,
        columns: [autoIncrementID], where: '$id = ?', whereArgs: [id]);

    print('ans length ${maps.length}');

    return maps;
  }

  deleteAll() async {
    Database db = await database;
    db.rawDelete("Delete from news");
  }

  Future<bool> deleteNews(int id) async {
    Database db = await database;
    int res = await db.rawDelete('DELETE FROM news WHERE id = ?', [id]);
    return res > 0 ? true : false;
  }
}
