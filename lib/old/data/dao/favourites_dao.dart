import 'package:crypto_app/old/data/app_database.dart';
import 'package:crypto_app/old/data/models/favourites.dart';

class FavouritesDao {
  static const TABLE_NAME = 'favourites';

  static const COLUMN_ID = '_id';
  static const COLUMN_NAME = 'name';
  static const COLUMN_SYMBOL = 'symbol';

  final dbHelper = DatabaseHelper.instance;

  Future<int> insertIgnore(Favourites _favourite) async {
    var db = await dbHelper.database;
    return db.rawInsert(
        'INSERT OR IGNORE INTO $TABLE_NAME($COLUMN_NAME, $COLUMN_SYMBOL) VALUES(\"${_favourite.name}\", \"${_favourite.symbol}\")');
  }

  Future<int> delete(int idToDelete) async {
    return await dbHelper.delete(TABLE_NAME, idToDelete);
  }

  Future<List<Favourites>> getAll() async {
    return (await dbHelper.queryAllRows(TABLE_NAME)).map((e) => Favourites.fromMap(e)).toList();
  }
}
