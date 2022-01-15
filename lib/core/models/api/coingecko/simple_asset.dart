// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

List<SimpleAsset> simpleAssetFromJson(String str) => List<SimpleAsset>.from(
    json.decode(str).map((x) => SimpleAsset.fromJson(x)));

class SimpleAsset extends Equatable {
  final String id;
  final String symbol;
  final String name;

  const SimpleAsset(
      {required this.id, required this.symbol, required this.name});

  factory SimpleAsset.fromJson(Map<String, dynamic> json) {
    return SimpleAsset(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id, symbol, name];
}
