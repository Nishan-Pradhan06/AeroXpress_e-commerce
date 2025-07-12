// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_options_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShippingOptionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() shippingOptions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? shippingOptions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shippingOptions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShippingOptions value) shippingOptions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShippingOptions value)? shippingOptions,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShippingOptions value)? shippingOptions,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingOptionsEventCopyWith<$Res> {
  factory $ShippingOptionsEventCopyWith(
    ShippingOptionsEvent value,
    $Res Function(ShippingOptionsEvent) then,
  ) = _$ShippingOptionsEventCopyWithImpl<$Res, ShippingOptionsEvent>;
}

/// @nodoc
class _$ShippingOptionsEventCopyWithImpl<
  $Res,
  $Val extends ShippingOptionsEvent
>
    implements $ShippingOptionsEventCopyWith<$Res> {
  _$ShippingOptionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingOptionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ShippingOptionsImplCopyWith<$Res> {
  factory _$$ShippingOptionsImplCopyWith(
    _$ShippingOptionsImpl value,
    $Res Function(_$ShippingOptionsImpl) then,
  ) = __$$ShippingOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShippingOptionsImplCopyWithImpl<$Res>
    extends _$ShippingOptionsEventCopyWithImpl<$Res, _$ShippingOptionsImpl>
    implements _$$ShippingOptionsImplCopyWith<$Res> {
  __$$ShippingOptionsImplCopyWithImpl(
    _$ShippingOptionsImpl _value,
    $Res Function(_$ShippingOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShippingOptionsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShippingOptionsImpl implements _ShippingOptions {
  const _$ShippingOptionsImpl();

  @override
  String toString() {
    return 'ShippingOptionsEvent.shippingOptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShippingOptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() shippingOptions,
  }) {
    return shippingOptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? shippingOptions,
  }) {
    return shippingOptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? shippingOptions,
    required TResult orElse(),
  }) {
    if (shippingOptions != null) {
      return shippingOptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShippingOptions value) shippingOptions,
  }) {
    return shippingOptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShippingOptions value)? shippingOptions,
  }) {
    return shippingOptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShippingOptions value)? shippingOptions,
    required TResult orElse(),
  }) {
    if (shippingOptions != null) {
      return shippingOptions(this);
    }
    return orElse();
  }
}

abstract class _ShippingOptions implements ShippingOptionsEvent {
  const factory _ShippingOptions() = _$ShippingOptionsImpl;
}
