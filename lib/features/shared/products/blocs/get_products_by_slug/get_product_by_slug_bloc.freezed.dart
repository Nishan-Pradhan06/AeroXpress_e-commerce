// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_product_by_slug_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetProductBySlugEvent {
  String get productSlug => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productSlug) getProductBySlug,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productSlug)? getProductBySlug,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productSlug)? getProductBySlug,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProdyctBySlug value) getProductBySlug,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProdyctBySlug value)? getProductBySlug,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProdyctBySlug value)? getProductBySlug,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of GetProductBySlugEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductBySlugEventCopyWith<GetProductBySlugEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductBySlugEventCopyWith<$Res> {
  factory $GetProductBySlugEventCopyWith(
    GetProductBySlugEvent value,
    $Res Function(GetProductBySlugEvent) then,
  ) = _$GetProductBySlugEventCopyWithImpl<$Res, GetProductBySlugEvent>;
  @useResult
  $Res call({String productSlug});
}

/// @nodoc
class _$GetProductBySlugEventCopyWithImpl<
  $Res,
  $Val extends GetProductBySlugEvent
>
    implements $GetProductBySlugEventCopyWith<$Res> {
  _$GetProductBySlugEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductBySlugEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productSlug = null}) {
    return _then(
      _value.copyWith(
            productSlug:
                null == productSlug
                    ? _value.productSlug
                    : productSlug // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetProdyctBySlugImplCopyWith<$Res>
    implements $GetProductBySlugEventCopyWith<$Res> {
  factory _$$GetProdyctBySlugImplCopyWith(
    _$GetProdyctBySlugImpl value,
    $Res Function(_$GetProdyctBySlugImpl) then,
  ) = __$$GetProdyctBySlugImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String productSlug});
}

/// @nodoc
class __$$GetProdyctBySlugImplCopyWithImpl<$Res>
    extends _$GetProductBySlugEventCopyWithImpl<$Res, _$GetProdyctBySlugImpl>
    implements _$$GetProdyctBySlugImplCopyWith<$Res> {
  __$$GetProdyctBySlugImplCopyWithImpl(
    _$GetProdyctBySlugImpl _value,
    $Res Function(_$GetProdyctBySlugImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetProductBySlugEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productSlug = null}) {
    return _then(
      _$GetProdyctBySlugImpl(
        productSlug:
            null == productSlug
                ? _value.productSlug
                : productSlug // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetProdyctBySlugImpl implements _GetProdyctBySlug {
  const _$GetProdyctBySlugImpl({required this.productSlug});

  @override
  final String productSlug;

  @override
  String toString() {
    return 'GetProductBySlugEvent.getProductBySlug(productSlug: $productSlug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProdyctBySlugImpl &&
            (identical(other.productSlug, productSlug) ||
                other.productSlug == productSlug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productSlug);

  /// Create a copy of GetProductBySlugEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProdyctBySlugImplCopyWith<_$GetProdyctBySlugImpl> get copyWith =>
      __$$GetProdyctBySlugImplCopyWithImpl<_$GetProdyctBySlugImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productSlug) getProductBySlug,
  }) {
    return getProductBySlug(productSlug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productSlug)? getProductBySlug,
  }) {
    return getProductBySlug?.call(productSlug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productSlug)? getProductBySlug,
    required TResult orElse(),
  }) {
    if (getProductBySlug != null) {
      return getProductBySlug(productSlug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProdyctBySlug value) getProductBySlug,
  }) {
    return getProductBySlug(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProdyctBySlug value)? getProductBySlug,
  }) {
    return getProductBySlug?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProdyctBySlug value)? getProductBySlug,
    required TResult orElse(),
  }) {
    if (getProductBySlug != null) {
      return getProductBySlug(this);
    }
    return orElse();
  }
}

abstract class _GetProdyctBySlug implements GetProductBySlugEvent {
  const factory _GetProdyctBySlug({required final String productSlug}) =
      _$GetProdyctBySlugImpl;

  @override
  String get productSlug;

  /// Create a copy of GetProductBySlugEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProdyctBySlugImplCopyWith<_$GetProdyctBySlugImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
