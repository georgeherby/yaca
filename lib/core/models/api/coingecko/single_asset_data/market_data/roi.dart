import 'dart:convert';

import 'package:equatable/equatable.dart';

class Roi extends Equatable {
  final double? times;
  final String? currency;
  final double? percentage;

  const Roi({this.times, this.currency, this.percentage});

  factory Roi.fromMap(Map<String, dynamic>? json) {
    return Roi(
        times: json?['times']?.toDouble(),
        currency: json?['currency']?.toString(),
        percentage: json?['percentage']?.toDouble());
  }

  Map<String, dynamic> toMap() {
    return {'times': times, 'currency': currency, 'percentage': percentage};
  }

  String toJson() => json.encode(toMap());

  factory Roi.fromJson(String source) => Roi.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [times, currency, percentage];
}
