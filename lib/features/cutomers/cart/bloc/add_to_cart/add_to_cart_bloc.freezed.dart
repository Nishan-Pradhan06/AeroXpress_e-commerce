// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddToCartEvent {
  int get productId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId, int quantity) addToCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId, int quantity)? addToCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId, int quantity)? addToCart,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AddToCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddToCartEventCopyWith<AddToCartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddToCartEventCopyWith<$Res> {
  factory $AddToCartEventCopyWith(
    AddToCartEvent value,
    $Res Function(AddToCartEvent) then,
  ) = _$AddToCartEventCopyWithImpl<$Res, AddToCartEvent>;
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class _$AddToCartEventCopyWithImpl<$Res, $Val extends AddToCartEvent>
    implements $AddToCartEventCopyWith<$Res> {
  _$AddToCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddToCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? quantity = null}) {
    return _then(
      _value.copyWith(
            productId:
                null == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int,
            quantity:
                null == quantity
                    ? _value.quantity
                    : quantity // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res>
    implements $AddToCartEventCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
    _$AddToCartImpl value,
    $Res Function(_$AddToCartImpl) then,
  ) = __$$AddToCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int productId, int quantity});
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$AddToCartEventCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
    _$AddToCartImpl _value,
    $Res Function(_$AddToCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddToCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? quantity = null}) {
    return _then(
      _$AddToCartImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int,
        quantity:
            null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$AddToCartImpl implements _AddToCart {
  const _$AddToCartImpl({required this.productId, required this.quantity});

  @override
  final int productId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'AddToCartEvent.addToCart(productId: $productId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity);

  /// Create a copy of AddToCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId, int quantity) addToCart,
  }) {
    return addToCart(productId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId, int quantity)? addToCart,
  }) {
    return addToCart?.call(productId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId, int quantity)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(productId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements AddToCartEvent {
  const factory _AddToCart({
    required final int productId,
    required final int quantity,
  }) = _$AddToCartImpl;

  @override
  int get productId;
  @override
  int get quantity;

  /// Create a copy of AddToCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
