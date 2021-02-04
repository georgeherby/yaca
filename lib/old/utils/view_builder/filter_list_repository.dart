import 'package:crypto_app/old/utils/view_builder/list_repository.dart';

/// [FilterListRepository] extends a [ListRepository] with filtering capabilities.
///
/// [T] - the type of returned elements.
/// [F] - the filter type. It can be just a [String] for queries as well as
/// any object when filtering is more sophisticated.
abstract class FilterListRepository<T, F> extends ListRepository<T> {
  /// Retrieves elements matching the given [filter].
  Future<List<T>> getBy(F filter);
}
