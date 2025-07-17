// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VendorOrdersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getVendorOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getVendorOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getVendorOrders,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VendorOrders value) getVendorOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VendorOrders value)? getVendorOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VendorOrders value)? getVendorOrders,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorOrdersEventCopyWith<$Res> {
  factory $VendorOrdersEventCopyWith(
    VendorOrdersEvent value,
    $Res Function(VendorOrdersEvent) then,
  ) = _$VendorOrdersEventCopyWithImpl<$Res, VendorOrdersEvent>;
}

/// @nodoc
class _$VendorOrdersEventCopyWithImpl<$Res, $Val extends VendorOrdersEvent>
    implements $VendorOrdersEventCopyWith<$Res> {
  _$VendorOrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VendorOrdersImplCopyWith<$Res> {
  factory _$$VendorOrdersImplCopyWith(
    _$VendorOrdersImpl value,
    $Res Function(_$VendorOrdersImpl) then,
  ) = __$$VendorOrdersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VendorOrdersImplCopyWithImpl<$Res>
    extends _$VendorOrdersEventCopyWithImpl<$Res, _$VendorOrdersImpl>
    implements _$$VendorOrdersImplCopyWith<$Res> {
  __$$VendorOrdersImplCopyWithImpl(
    _$VendorOrdersImpl _value,
    $Res Function(_$VendorOrdersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VendorOrdersImpl implements _VendorOrders {
  const _$VendorOrdersImpl();

  @override
  String toString() {
    return 'VendorOrdersEvent.getVendorOrders()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VendorOrdersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getVendorOrders,
  }) {
    return getVendorOrders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getVendorOrders,
  }) {
    return getVendorOrders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getVendorOrders,
    required TResult orElse(),
  }) {
    if (getVendorOrders != null) {
      return getVendorOrders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VendorOrders value) getVendorOrders,
  }) {
    return getVendorOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VendorOrders value)? getVendorOrders,
  }) {
    return getVendorOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VendorOrders value)? getVendorOrders,
    required TResult orElse(),
  }) {
    if (getVendorOrders != null) {
      return getVendorOrders(this);
    }
    return orElse();
  }
}

abstract class _VendorOrders implements VendorOrdersEvent {
  const factory _VendorOrders() = _$VendorOrdersImpl;
}
