import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBManager{
  
  Database _database;
  Future openDB() async{
    if(_database == null){
      _database = await openDatabase(
        join(await getDatabasesPath(), "news.db"),
        version: 1,
        onCreate: (Database db, int version) async{
          await db.execute("CREATE TABLE news (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, subtitle TEXT, picture TEXT, description TEXT)");
        }
      );
    }
  }

  Future<int> insertNews(DBNews dbnews) async{
    await openDB();
    var result =  await _database.insert('news',dbnews.toMap());
    print(result);
    return result;
    
  }

  Future<List> getNewsList() async{
    await openDB();
    var result = await _database.query('news', columns: ['id', 'title', 'subtitle', 'picture', 'description'] );
    return result;
  }

  Future<int> updateNews(DBNews dbnews) async{
    await openDB();
    return await _database.update('news', dbnews.toMap(), where: "id=?", whereArgs: [dbnews.id]);
  }

  Future<void> deleteNews(DBNews dbnews) async{
    await openDB();
    await _database.delete('news', where: "id=?", whereArgs: [dbnews.id]
    );
  }

}


class DBNews{
  int id;
  String title;
  String subtitle;
  String picture;
  String description;

  DBNews({
    this.id,
    this.title,
    this.subtitle,
    this.picture,
    this.description,
  }
  );

  Map<String, dynamic> toMap(){
    return{
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'description': description
    };
  }

}
