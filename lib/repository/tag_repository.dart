import 'package:sqflite/sqflite.dart';
import 'package:todo_reminder/model/tag_category.dart';
import 'package:todo_reminder/utils/db_provider.dart';

class TagRepository {
  final _table = 'tag_category';
  Database db;

  Future<bool> save(TagCategory tag) async {
    db = await DBProvider.db.database;
    await db.insert(_table, tag.toMap());
    return true;
  }
}
