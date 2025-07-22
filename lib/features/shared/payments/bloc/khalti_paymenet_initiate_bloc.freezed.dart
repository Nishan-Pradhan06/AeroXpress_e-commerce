// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'khalti_paymenet_initiate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$KhaltiPaymenetInitiateEvent {
  int get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int orderId) initiate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int orderId)? initiate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int orderId)? initiate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initiate value) initiate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initiate value)? initiate,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initiate value)? initiate,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of KhaltiPaymenetInitiateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KhaltiPaymenetInitiateEventCopyWith<KhaltiPaymenetInitiateEvent>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KhaltiPaymenetInitiateEventCopyWith<$Res> {
  factory $KhaltiPaymenetInitiateEventCopyWith(
    KhaltiPaymenetInitiateEvent value,
    $Res Function(KhaltiPaymenetInitiateEvent) then,
  ) =
      _$KhaltiPaymenetInitiateEventCopyWithImpl<
        $Res,
        KhaltiPaymenetInitiateEvent
      >;
  @useResult
  $Res call({int orderId});
}

/// @nodoc
class _$KhaltiPaymenetInitiateEventCopyWithImpl<
  $Res,
  $Val extends KhaltiPaymenetInitiateEvent
>
    implements $KhaltiPaymenetInitiateEventCopyWith<$Res> {
  _$KhaltiPaymenetInitiateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KhaltiPaymenetInitiateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitiateImplCopyWith<$Res>
    implements $KhaltiPaymenetInitiateEventCopyWith<$Res> {
  factory _$$InitiateImplCopyWith(
    _$InitiateImpl value,
    $Res Function(_$InitiateImpl) then,
  ) = __$$InitiateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int orderId});
}

/// @nodoc
class __$$InitiateImplCopyWithImpl<$Res>
    extends _$KhaltiPaymenetInitiateEventCopyWithImpl<$Res, _$InitiateImpl>
    implements _$$InitiateImplCopyWith<$Res> {
  __$$InitiateImplCopyWithImpl(
    _$InitiateImpl _value,
    $Res Function(_$InitiateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KhaltiPaymenetInitiateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null}) {
    return _then(
      _$InitiateImpl(
        null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$InitiateImpl implements _Initiate {
  const _$InitiateImpl(this.orderId);

  @override
  final int orderId;

  @override
  String toString() {
    return 'KhaltiPaymenetInitiateEvent.initiate(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  /// Create a copy of KhaltiPaymenetInitiateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateImplCopyWith<_$InitiateImpl> get copyWith =>
      __$$InitiateImplCopyWithImpl<_$InitiateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int orderId) initiate,
  }) {
    return initiate(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int orderId)? initiate,
  }) {
    return initiate?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int orderId)? initiate,
    required TResult orElse(),
  }) {
    if (initiate != null) {
      return initiate(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initiate value) initiate,
  }) {
    return initiate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initiate value)? initiate,
  }) {
    return initiate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initiate value)? initiate,
    required TResult orElse(),
  }) {
    if (initiate != null) {
      return initiate(this);
    }
    return orElse();
  }
}

abstract class _Initiate implements KhaltiPaymenetInitiateEvent {
  const factory _Initiate(final int orderId) = _$InitiateImpl;

  @override
  int get orderId;

  /// Create a copy of KhaltiPaymenetInitiateEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateImplCopyWith<_$InitiateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
