// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_vendors_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetVendorsProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getVendorProducts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getVendorProducts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getVendorProducts,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVendorProducts value) getVendorProducts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVendorProducts value)? getVendorProducts,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVendorProducts value)? getVendorProducts,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetVendorsProductsEventCopyWith<$Res> {
  factory $GetVendorsProductsEventCopyWith(
    GetVendorsProductsEvent value,
    $Res Function(GetVendorsProductsEvent) then,
  ) = _$GetVendorsProductsEventCopyWithImpl<$Res, GetVendorsProductsEvent>;
}

/// @nodoc
class _$GetVendorsProductsEventCopyWithImpl<
  $Res,
  $Val extends GetVendorsProductsEvent
>
    implements $GetVendorsProductsEventCopyWith<$Res> {
  _$GetVendorsProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetVendorsProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetVendorProductsImplCopyWith<$Res> {
  factory _$$GetVendorProductsImplCopyWith(
    _$GetVendorProductsImpl value,
    $Res Function(_$GetVendorProductsImpl) then,
  ) = __$$GetVendorProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetVendorProductsImplCopyWithImpl<$Res>
    extends _$GetVendorsProductsEventCopyWithImpl<$Res, _$GetVendorProductsImpl>
    implements _$$GetVendorProductsImplCopyWith<$Res> {
  __$$GetVendorProductsImplCopyWithImpl(
    _$GetVendorProductsImpl _value,
    $Res Function(_$GetVendorProductsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetVendorsProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetVendorProductsImpl implements _GetVendorProducts {
  const _$GetVendorProductsImpl();

  @override
  String toString() {
    return 'GetVendorsProductsEvent.getVendorProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetVendorProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getVendorProducts,
  }) {
    return getVendorProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getVendorProducts,
  }) {
    return getVendorProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getVendorProducts,
    required TResult orElse(),
  }) {
    if (getVendorProducts != null) {
      return getVendorProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetVendorProducts value) getVendorProducts,
  }) {
    return getVendorProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetVendorProducts value)? getVendorProducts,
  }) {
    return getVendorProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetVendorProducts value)? getVendorProducts,
    required TResult orElse(),
  }) {
    if (getVendorProducts != null) {
      return getVendorProducts(this);
    }
    return orElse();
  }
}

abstract class _GetVendorProducts implements GetVendorsProductsEvent {
  const factory _GetVendorProducts() = _$GetVendorProductsImpl;
}
