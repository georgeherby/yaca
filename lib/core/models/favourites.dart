// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favourites.g.dart';

@HiveType(typeId: 0)
class Favourites extends Equatable {
  const Favourites({
    this.id,
    required this.name,
    required this.symbol,
    required this.coinId,
  });
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String symbol;
  @HiveField(3)
  final String coinId;

  @override
  List<Object?> get props => [id, name, symbol, coinId];
}
