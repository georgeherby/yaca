// 📦 Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:crypto_app/core/models/favourites.dart';

class FavouritesDao {
  static const TABLE_NAME = 'favourites';

  static const COLUMN_ID = '_id';
  static const COLUMN_NAME = 'name';
  static const COLUMN_SYMBOL = 'symbol';

  final Box<Favourites> box;

  const FavouritesDao({required this.box});

  Future<int> insertIgnore(Favourites _favourite) async {
    return await box.add(_favourite);
  }

  Future<void> delete(int idToDelete) async {
    return await box.deleteAt(idToDelete);
  }

  Future<List<Favourites>> getAll() {
    return Future.value((box.values).toList());
  }
}
