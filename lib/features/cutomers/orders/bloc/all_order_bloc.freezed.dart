// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AllOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllOrder,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllOrder,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllOrder,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllOrder value) getAllOrder,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllOrder value)? getAllOrder,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllOrder value)? getAllOrder,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllOrderEventCopyWith<$Res> {
  factory $AllOrderEventCopyWith(
    AllOrderEvent value,
    $Res Function(AllOrderEvent) then,
  ) = _$AllOrderEventCopyWithImpl<$Res, AllOrderEvent>;
}

/// @nodoc
class _$AllOrderEventCopyWithImpl<$Res, $Val extends AllOrderEvent>
    implements $AllOrderEventCopyWith<$Res> {
  _$AllOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllOrderImplCopyWith<$Res> {
  factory _$$GetAllOrderImplCopyWith(
    _$GetAllOrderImpl value,
    $Res Function(_$GetAllOrderImpl) then,
  ) = __$$GetAllOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllOrderImplCopyWithImpl<$Res>
    extends _$AllOrderEventCopyWithImpl<$Res, _$GetAllOrderImpl>
    implements _$$GetAllOrderImplCopyWith<$Res> {
  __$$GetAllOrderImplCopyWithImpl(
    _$GetAllOrderImpl _value,
    $Res Function(_$GetAllOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AllOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllOrderImpl implements _GetAllOrder {
  const _$GetAllOrderImpl();

  @override
  String toString() {
    return 'AllOrderEvent.getAllOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllOrder,
  }) {
    return getAllOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllOrder,
  }) {
    return getAllOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllOrder,
    required TResult orElse(),
  }) {
    if (getAllOrder != null) {
      return getAllOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllOrder value) getAllOrder,
  }) {
    return getAllOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllOrder value)? getAllOrder,
  }) {
    return getAllOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllOrder value)? getAllOrder,
    required TResult orElse(),
  }) {
    if (getAllOrder != null) {
      return getAllOrder(this);
    }
    return orElse();
  }
}

abstract class _GetAllOrder implements AllOrderEvent {
  const factory _GetAllOrder() = _$GetAllOrderImpl;
}
