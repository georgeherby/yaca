import 'package:yaca/core/models/sort_type.dart';

extension SortOrderExt on SortOrder {
  bool isAscending() {
    return this == SortOrder.ascending;
  }

  SortOrder inverse() {
    switch (this) {
      case SortOrder.ascending:
        return SortOrder.descending;
      case SortOrder.descending:
        return SortOrder.ascending;
    }
  }
}
