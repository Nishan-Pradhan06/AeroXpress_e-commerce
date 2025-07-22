// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateOrdersEvent {
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> payload)
    createOrderWithCashOnDelivery,
    required TResult Function(Map<String, dynamic> payload)
    createORderWithKhalti,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult? Function(Map<String, dynamic> payload)? createORderWithKhalti,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult Function(Map<String, dynamic> payload)? createORderWithKhalti,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateOrdersWithCashOnDelivery value)
    createOrderWithCashOnDelivery,
    required TResult Function(_CreateOrdersWithKhalti value)
    createORderWithKhalti,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult? Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateOrdersEventCopyWith<CreateOrdersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrdersEventCopyWith<$Res> {
  factory $CreateOrdersEventCopyWith(
    CreateOrdersEvent value,
    $Res Function(CreateOrdersEvent) then,
  ) = _$CreateOrdersEventCopyWithImpl<$Res, CreateOrdersEvent>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class _$CreateOrdersEventCopyWithImpl<$Res, $Val extends CreateOrdersEvent>
    implements $CreateOrdersEventCopyWith<$Res> {
  _$CreateOrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _value.copyWith(
            payload:
                null == payload
                    ? _value.payload
                    : payload // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateOrdersWithCashOnDeliveryImplCopyWith<$Res>
    implements $CreateOrdersEventCopyWith<$Res> {
  factory _$$CreateOrdersWithCashOnDeliveryImplCopyWith(
    _$CreateOrdersWithCashOnDeliveryImpl value,
    $Res Function(_$CreateOrdersWithCashOnDeliveryImpl) then,
  ) = __$$CreateOrdersWithCashOnDeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$CreateOrdersWithCashOnDeliveryImplCopyWithImpl<$Res>
    extends
        _$CreateOrdersEventCopyWithImpl<
          $Res,
          _$CreateOrdersWithCashOnDeliveryImpl
        >
    implements _$$CreateOrdersWithCashOnDeliveryImplCopyWith<$Res> {
  __$$CreateOrdersWithCashOnDeliveryImplCopyWithImpl(
    _$CreateOrdersWithCashOnDeliveryImpl _value,
    $Res Function(_$CreateOrdersWithCashOnDeliveryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$CreateOrdersWithCashOnDeliveryImpl(
        payload:
            null == payload
                ? _value._payload
                : payload // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$CreateOrdersWithCashOnDeliveryImpl
    implements _CreateOrdersWithCashOnDelivery {
  const _$CreateOrdersWithCashOnDeliveryImpl({
    required final Map<String, dynamic> payload,
  }) : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'CreateOrdersEvent.createOrderWithCashOnDelivery(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersWithCashOnDeliveryImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrdersWithCashOnDeliveryImplCopyWith<
    _$CreateOrdersWithCashOnDeliveryImpl
  >
  get copyWith => __$$CreateOrdersWithCashOnDeliveryImplCopyWithImpl<
    _$CreateOrdersWithCashOnDeliveryImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> payload)
    createOrderWithCashOnDelivery,
    required TResult Function(Map<String, dynamic> payload)
    createORderWithKhalti,
  }) {
    return createOrderWithCashOnDelivery(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult? Function(Map<String, dynamic> payload)? createORderWithKhalti,
  }) {
    return createOrderWithCashOnDelivery?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult Function(Map<String, dynamic> payload)? createORderWithKhalti,
    required TResult orElse(),
  }) {
    if (createOrderWithCashOnDelivery != null) {
      return createOrderWithCashOnDelivery(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateOrdersWithCashOnDelivery value)
    createOrderWithCashOnDelivery,
    required TResult Function(_CreateOrdersWithKhalti value)
    createORderWithKhalti,
  }) {
    return createOrderWithCashOnDelivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult? Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
  }) {
    return createOrderWithCashOnDelivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
    required TResult orElse(),
  }) {
    if (createOrderWithCashOnDelivery != null) {
      return createOrderWithCashOnDelivery(this);
    }
    return orElse();
  }
}

abstract class _CreateOrdersWithCashOnDelivery implements CreateOrdersEvent {
  const factory _CreateOrdersWithCashOnDelivery({
    required final Map<String, dynamic> payload,
  }) = _$CreateOrdersWithCashOnDeliveryImpl;

  @override
  Map<String, dynamic> get payload;

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrdersWithCashOnDeliveryImplCopyWith<
    _$CreateOrdersWithCashOnDeliveryImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateOrdersWithKhaltiImplCopyWith<$Res>
    implements $CreateOrdersEventCopyWith<$Res> {
  factory _$$CreateOrdersWithKhaltiImplCopyWith(
    _$CreateOrdersWithKhaltiImpl value,
    $Res Function(_$CreateOrdersWithKhaltiImpl) then,
  ) = __$$CreateOrdersWithKhaltiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$CreateOrdersWithKhaltiImplCopyWithImpl<$Res>
    extends _$CreateOrdersEventCopyWithImpl<$Res, _$CreateOrdersWithKhaltiImpl>
    implements _$$CreateOrdersWithKhaltiImplCopyWith<$Res> {
  __$$CreateOrdersWithKhaltiImplCopyWithImpl(
    _$CreateOrdersWithKhaltiImpl _value,
    $Res Function(_$CreateOrdersWithKhaltiImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$CreateOrdersWithKhaltiImpl(
        payload:
            null == payload
                ? _value._payload
                : payload // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$CreateOrdersWithKhaltiImpl implements _CreateOrdersWithKhalti {
  const _$CreateOrdersWithKhaltiImpl({
    required final Map<String, dynamic> payload,
  }) : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'CreateOrdersEvent.createORderWithKhalti(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrdersWithKhaltiImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrdersWithKhaltiImplCopyWith<_$CreateOrdersWithKhaltiImpl>
  get copyWith =>
      __$$CreateOrdersWithKhaltiImplCopyWithImpl<_$CreateOrdersWithKhaltiImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> payload)
    createOrderWithCashOnDelivery,
    required TResult Function(Map<String, dynamic> payload)
    createORderWithKhalti,
  }) {
    return createORderWithKhalti(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult? Function(Map<String, dynamic> payload)? createORderWithKhalti,
  }) {
    return createORderWithKhalti?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> payload)?
    createOrderWithCashOnDelivery,
    TResult Function(Map<String, dynamic> payload)? createORderWithKhalti,
    required TResult orElse(),
  }) {
    if (createORderWithKhalti != null) {
      return createORderWithKhalti(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateOrdersWithCashOnDelivery value)
    createOrderWithCashOnDelivery,
    required TResult Function(_CreateOrdersWithKhalti value)
    createORderWithKhalti,
  }) {
    return createORderWithKhalti(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult? Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
  }) {
    return createORderWithKhalti?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateOrdersWithCashOnDelivery value)?
    createOrderWithCashOnDelivery,
    TResult Function(_CreateOrdersWithKhalti value)? createORderWithKhalti,
    required TResult orElse(),
  }) {
    if (createORderWithKhalti != null) {
      return createORderWithKhalti(this);
    }
    return orElse();
  }
}

abstract class _CreateOrdersWithKhalti implements CreateOrdersEvent {
  const factory _CreateOrdersWithKhalti({
    required final Map<String, dynamic> payload,
  }) = _$CreateOrdersWithKhaltiImpl;

  @override
  Map<String, dynamic> get payload;

  /// Create a copy of CreateOrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateOrdersWithKhaltiImplCopyWith<_$CreateOrdersWithKhaltiImpl>
  get copyWith => throw _privateConstructorUsedError;
}
