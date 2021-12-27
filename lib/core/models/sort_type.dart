enum SortType {
  sortByRank,
  sortBy24hPercentageChange,
}

enum SortOrder { ascending, descending }

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
