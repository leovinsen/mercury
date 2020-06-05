import 'package:mercury/database/article_schema.dart';
import 'package:mercury/exception/result_more_than_one_exception.dart';
import 'package:mercury/model/news_article.dart';
import 'package:sqflite/sqlite_api.dart';

class ArticleDao {
  final Database _db;

  const ArticleDao(this._db);

  ///Equivalent to "SELECT * FROM `$tableArticle`;"
  Future<List<NewsArticle>> findAll() async {
    ///Each map represents a record in a Table. Similar to a JSON object.
    List<Map<String, dynamic>> records = await _db.query(tableArticle);

    return records.map((record) => NewsArticle.fromDB(record)).toList();
  }

  ///Equivalent to "SELECT * FROM `$tableArticle` WHERE `$articleUrl` = `$url`;""
  Future<NewsArticle> findByUrl(String url) async {
    List<Map<String, dynamic>> records = await _db.query(
      tableArticle,
      where: '$articleUrl = ?',
      whereArgs: [url],
    );

    if (records.length == 0) return null;

    //There should only be one record, as each url is unique
    if (records.length > 1) throw ResultMoreThanOneException(records);

    return NewsArticle.fromDB(records[0]);
  }

  ///Equivalent to "INSERT INTO `$tableArticle`"
  Future<int> add(NewsArticle article) async {
    var result = await _db.insert(
      tableArticle,
      article.toDB(),
    );

    return result;
  }

  ///Equivalent to "DELETE FROM `$tableArticle` WHERE `$articleUrl` = `$url`;"
  Future<int> deleteByUrl(String url) async {
    int deletedRowsCount = await _db.delete(
      tableArticle,
      where: '$articleUrl = ?',
      whereArgs: [url],
    );

    return deletedRowsCount;
  }

  ///Equivalent to "DELETE FROM `$tableArticle`;"
  Future<int> deleteAll() async {
    return await _db.delete(tableArticle);
  }
}
