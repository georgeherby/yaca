// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favourites.g.dart';

@HiveType(typeId: 0)
class Favourites extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String symbol;

  Favourites({
    this.id,
    required this.name,
    required this.symbol,
  });

  @override
  List<Object?> get props => [id, name, symbol];
}
