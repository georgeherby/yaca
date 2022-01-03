// 📦 Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// 🌎 Project imports:
import 'package:yaca/core/models/favourites.dart';

class FavouritesDao {
  final Box<Favourites> box;

  const FavouritesDao({required this.box});

  Future<int> insertFavourite(Favourites _favourite) async {
    return await box.add(Favourites(
        name: _favourite.name,
        coinId: _favourite.coinId,
        symbol: _favourite.symbol));
  }

  Future<void> delete(int idToDelete) async {
    return await box.delete(idToDelete);
  }

  Future<List<Favourites>> getAll() {
    var list = <Favourites>[];

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
