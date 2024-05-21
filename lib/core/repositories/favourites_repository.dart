// 📦 Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/favourites.dart';

class FavouritesDao {
  const FavouritesDao({required this.box});
  final Box<Favourites> box;

  Future<int> insertFavourite(Favourites favourite) async {
    return box.add(Favourites(
        name: favourite.name,
        coinId: favourite.coinId,
        symbol: favourite.symbol));
  }

  Future<void> delete(int idToDelete) async {
    return box.delete(idToDelete);
  }

  Future<List<Favourites>> getAll() {
    final list = <Favourites>[];

    box.toMap().forEach((key, value) {
      list.add(Favourites(
          id: key,
          name: value.name,
          coinId: value.coinId,
          symbol: value.symbol));
    });

    return Future.value(list);
  }
}
