// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favourites.g.dart';

@HiveType(typeId: 1)
class Favourites extends HiveObject {

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String symbol;

  Favourites({
    required this.name,
    required this.symbol,
  });
}
