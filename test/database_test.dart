import 'package:flutter_test/flutter_test.dart';
import 'package:mercury/database/article_dao.dart';
import 'package:mercury/database/article_schema.dart';
import 'package:mercury/model/news_article.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_ffi_test/sqflite_ffi_test.dart';

void main() {
  // Set sqflite ffi support in test
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiTestInit();

  test('Test DB and DAO', () async {
    var db = await openDatabase(inMemoryDatabasePath);
    expect(await db.getVersion(), 0);

    await db.execute(articleCreateTableSql);

    var articleDao = ArticleDao(db);

    var addArticle = NewsArticle(
        null,
        "test author",
        "test title",
        "test description",
        "https://www.google.com",
        null,
        DateTime.now(),
        "test content");

    int id = await articleDao.add(addArticle);

    var article = await articleDao.findByPrimaryKey(id);
    expect(article, isNotNull);

    print(article);

    bool exception = false;
    try {
      await articleDao.add(addArticle);
    } on DatabaseException {
      exception = true;
    }

    expect(exception, true);

    await db.close();
  });
}
