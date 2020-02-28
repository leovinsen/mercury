import 'package:mercury/exception/result_more_than_one_exception.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class BaseDao<T> {
  final Database _db;
  const BaseDao(this._db);

  Database get db => _db;

  String tableNameInDB();

  ///return the entity.fromDB()
  T entityFromDB(Map<String, dynamic> map);

  ///return entity.toDB()
  Map<String, dynamic> entityToDB(T entity);

  ///Define the primary key clause for [findByPrimaryKey] to work
  String primaryKeyWhereClause();

  ///Return the primary key
  int primaryKeyWhereArgs(T entity);

  Future<T> findByPrimaryKey(int pk) async {
    var result = await query(where: primaryKeyWhereClause(), whereArgs: [pk]);

    if (result.length == 0) return null;

    if (result.length > 1) throw ResultMoreThanOneException(result);

    return entityFromDB(result[0]);
  }

  Future<List<T>> getAll() async {
    var result = await query();

    return result.map((map) => entityFromDB(map)).toList();
  }

  ///Convenience method for querying the DB
  Future<List<Map<String, dynamic>>> query(
      {String where, List<dynamic> whereArgs}) async {
    return await _db.query(tableNameInDB(), where: where, whereArgs: whereArgs);
  }

  Future<int> update(T entity) async {
    var result = await _db.update(tableNameInDB(), entityToDB(entity),
        where: primaryKeyWhereClause(),
        whereArgs: [primaryKeyWhereArgs(entity)]);

    return result;
  }

  Future<int> add(T entity) async {
    var result = await _db.insert(tableNameInDB(), entityToDB(entity));

    return result;
  }

  Future<int> delete(T entity) async {
    return await _db.delete(tableNameInDB(),
        where: primaryKeyWhereClause(),
        whereArgs: [primaryKeyWhereArgs(entity)]);
  }

  Future<int> deleteAll() async {
    return await _db.delete(tableNameInDB());
  }
}
