import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Base class for states.
@immutable
abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];
}

/// The initial view state.
class Initial extends ViewState {
  const Initial();

  @override
  String toString() => 'Initial';
}

/// State indicating that data is being loaded.
class Loading extends ViewState {
  const Loading();

  @override
  String toString() => 'Loading';
}

/// State indicating that data is being refreshed. It can occur only after
/// initial loading ends with [Success] or [Empty] result. It may contain
/// the data that has already been loaded.
class Refreshing<T extends Object> extends ViewState {
  final T data;

  const Refreshing(this.data);

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'Refreshing: $data';
}

/// State indicating that data was loaded successfully, but was null or empty.
class Empty extends ViewState {
  const Empty();

  @override
  String toString() => 'Empty';
}

/// State indicating that data was loaded successfully and is not null nor empty.
/// [T] - list element type.
class Success<T extends Object> extends ViewState {
  final T data;

  const Success(this.data);

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'Success: $data';
}

/// State indicating that loading or refreshing has failed. It contains an
/// exact [error] that has occurred.
class Failure extends ViewState {
  final dynamic error;

  const Failure(this.error) : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Failure: $error';
}
