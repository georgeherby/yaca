// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:equatable/equatable.dart';

/// Base class for all list events.
@immutable
abstract class ListEvent extends Equatable {
  const ListEvent();
}

/// Event for indicating that initial list load needs to be performed.
///
/// [F] - the filter type.
class LoadList<F extends Object?> extends ListEvent {
  const LoadList([this.filter]);
  final F? filter;

  @override
  List<Object> get props => filter != null ? [filter!] : [];

  @override
  String toString() => 'LoadList: $filter';
}

/// Event for indicating that list needs to be refreshed.
///
/// [F] - the filter type.
class RefreshList<F extends Object?> extends ListEvent {
  const RefreshList([this.filter]);
  final F? filter;

  @override
  List<Object> get props => filter != null ? [filter!] : [];

  @override
  String toString() => 'RefreshList: $filter';
}
