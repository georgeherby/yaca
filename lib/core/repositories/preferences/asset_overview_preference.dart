import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaca/core/models/sort_type.dart';

class AssetOverviewPreference {
  static const _sortOrderKey = 'CHOSEN_SORT_ORDER';
  static const _sortTypeKey = 'CHOSEN_SORT_TYPE';
  static const _defaultSortOrder = SortOrder.ascending;
  static const _defaultSortType = SortType.sortByRank;

  Future setSortType(SortType sortType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sortTypeKey, sortType.toString());
  }

  Future setSortOrder(SortOrder sortOrder) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sortOrderKey, sortOrder.toString());
  }

  Future<SortOrder> getSortOrder() async {
    var prefs = await SharedPreferences.getInstance();

    final sortOrder = prefs.getString(_sortOrderKey);
    if (sortOrder == null) {
      return _defaultSortOrder;
    }
    return SortOrder.values.firstWhere(
        (element) => element.toString() == sortOrder,
        orElse: () => _defaultSortOrder);
  }

  Future<SortType> getSortType() async {
    var prefs = await SharedPreferences.getInstance();

    final sortType = prefs.getString(_sortTypeKey);
    if (sortType == null) {
      return _defaultSortType;
    }

    var list = SortType.values;
    return list.firstWhere((element) => element.toString() == sortType,
        orElse: () => _defaultSortType);
  }
}
