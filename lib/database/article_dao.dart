import 'package:mercury/base/base_dao.dart';
import 'package:mercury/database/article_schema.dart';
import 'package:mercury/exception/result_more_than_one_exception.dart';
import 'package:mercury/model/news_article.dart';
import 'package:sqflite/sqlite_api.dart';

class ArticleDao extends BaseDao<NewsArticle> {
  ArticleDao(Database db) : super(db);

  @override
  NewsArticle entityFromDB(Map<String, dynamic> map) {
    return NewsArticle.fromDB(map);
  }

  @override
  Map<String, dynamic> entityToDB(NewsArticle entity) {
    return entity.toDB();
  }

  @override
  int primaryKeyWhereArgs(NewsArticle entity) {
    return entity.id;
  }

  @override
  String primaryKeyWhereClause() {
    return 'id = ?';
  }

  @override
  String tableNameInDB() {
    return tableArticle;
  }

  Future<NewsArticle> findByUrl(String url) async {
    var result = await query(
      where: 'url = ?',
      whereArgs: [url],
    );

    if (result.length == 0) return null;

    if (result.length > 1) throw ResultMoreThanOneException(result);

    return NewsArticle.fromDB(result[0]);
  }

  Future<int> deleteByUrl(String url) async {
    return await db.delete(tableNameInDB(), where: 'url=?', whereArgs: [url]);
  }
}
