// 🎯 Dart imports:
import 'dart:collection';

// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:yaca/core/exceptions/rate_limit_exception.dart';
import 'package:yaca/ui/utils/view_builder/filter_list_repository.dart';
import 'package:yaca/ui/utils/view_builder/list_events.dart';
import 'package:yaca/ui/utils/view_builder/view_state.dart';

/// A list BLoC with allowing filtering capabilities but without pagination.
/// Thus it should be used with a reasonable small amount of data.
///
/// Designed to collaborate with [ViewStateBuilder] for displaying data.
///
/// Call [loadElements] to perform initial data fetch.
/// Call [refreshElements] to perform a refresh.
///
/// [T] - the type of list elements.
/// [F] - the type of filter.
class FilterListBloc<T, F extends Object?> extends Bloc<ListEvent, ViewState> {
  final FilterListRepository<T, F> _repository;
  F? _filter;

  FilterListBloc(FilterListRepository<T, F> repository)
      : _repository = repository,
        super(const Initial()) {
    on<LoadList<F>>(_onLoadList);
    on<RefreshList<F>>(_onRefreshList);
  }

  F? get filter => _filter;

  /// Loads elements using the given [filter].
  ///
  /// It's most suitable for initial data fetch or for retry action when
  /// the first fetch fails. It can also be used when [filter] changes when a
  /// full reload is required.
  void loadElements({F? filter}) => add(LoadList(filter));

  /// Refreshes elements using the given [filter].
  ///
  /// The refresh is designed for being called after the initial fetch
  /// succeeds. It can be performed when the list has already been loaded.
  ///
  /// It can be used when [filter] changes and there's no need for displaying a
  /// loading indicator.
  void refreshElements({F? filter}) => add(RefreshList(filter));

  void _onLoadList(LoadList<F> event, Emitter<ViewState> emit) async {
    emit(const Loading());
    await _getListState(filter, emit);
  }

  void _onRefreshList(RefreshList<F> event, Emitter<ViewState> emit) async {
    if (_isRefreshPossible(event)) {
      final elements = _getCurrentStateElements();
      emit(Refreshing(elements));
      await _getListState(filter, emit);
    }
  }

  bool _isRefreshPossible(ListEvent event) =>
      state is Success ||
      state is Failure ||
      state is RateLimited ||
      state is Empty;

  List<T> _getCurrentStateElements() =>
      (state is Success<List<T>>) ? (state as Success<List<T>>).data : [];

  Future _getListState(F? filter, Emitter emit) async {
    try {
      final elements = await _getElementsFromRepository(filter);
      emit(elements.isNotEmpty
          ? Success<List<T>>(UnmodifiableListView<T>(elements.reversed))
          : const Empty());
    } on RateLimitException catch (_) {
      emit(const RateLimited());
    } on Exception catch (e, stacktrace) {
      debugPrint(stacktrace.toString());
      debugPrint(e.toString());
      emit(Failure(e));
    } finally {
      _filter = filter;
    }
  }

  Future<List<T>> _getElementsFromRepository(F? filter) {
    if (filter != null) {
      return _repository.getBy(filter);
    } else {
      return _repository.getAll();
    }
  }
}
