// 🌎 Project imports:
import 'package:crypto_app/core/repositories/favouritess_repository.dart';

class Favourites {
  final int? id;
  final String name;
  final String symbol;

  Favourites({
    this.id,
    required this.name,
    required this.symbol,
  });

  Map<String, dynamic> toMap() {
    return {
      '${FavouritesDao.COLUMN_ID}': id,
      '${FavouritesDao.COLUMN_NAME}': name,
      '${FavouritesDao.COLUMN_SYMBOL}': symbol,
    };
  }

  static Favourites fromMap(Map<String, dynamic> map) {
    return Favourites(
      id: map[FavouritesDao.COLUMN_ID],
      name: map[FavouritesDao.COLUMN_NAME],
      symbol: map[FavouritesDao.COLUMN_SYMBOL],
    );
  }
}
