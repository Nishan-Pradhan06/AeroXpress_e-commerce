// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_khalti_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VerifyKhaltiEvent {
  String get pidx => throw _privateConstructorUsedError;
  int get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pidx, int orderId) verify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pidx, int orderId)? verify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pidx, int orderId)? verify,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Verify value) verify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Verify value)? verify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Verify value)? verify,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of VerifyKhaltiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyKhaltiEventCopyWith<VerifyKhaltiEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyKhaltiEventCopyWith<$Res> {
  factory $VerifyKhaltiEventCopyWith(
    VerifyKhaltiEvent value,
    $Res Function(VerifyKhaltiEvent) then,
  ) = _$VerifyKhaltiEventCopyWithImpl<$Res, VerifyKhaltiEvent>;
  @useResult
  $Res call({String pidx, int orderId});
}

/// @nodoc
class _$VerifyKhaltiEventCopyWithImpl<$Res, $Val extends VerifyKhaltiEvent>
    implements $VerifyKhaltiEventCopyWith<$Res> {
  _$VerifyKhaltiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyKhaltiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pidx = null, Object? orderId = null}) {
    return _then(
      _value.copyWith(
            pidx:
                null == pidx
                    ? _value.pidx
                    : pidx // ignore: cast_nullable_to_non_nullable
                        as String,
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
abstract class _$$VerifyImplCopyWith<$Res>
    implements $VerifyKhaltiEventCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
    _$VerifyImpl value,
    $Res Function(_$VerifyImpl) then,
  ) = __$$VerifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pidx, int orderId});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$VerifyKhaltiEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
    _$VerifyImpl _value,
    $Res Function(_$VerifyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyKhaltiEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pidx = null, Object? orderId = null}) {
    return _then(
      _$VerifyImpl(
        pidx:
            null == pidx
                ? _value.pidx
                : pidx // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$VerifyImpl implements _Verify {
  const _$VerifyImpl({required this.pidx, required this.orderId});

  @override
  final String pidx;
  @override
  final int orderId;

  @override
  String toString() {
    return 'VerifyKhaltiEvent.verify(pidx: $pidx, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.pidx, pidx) || other.pidx == pidx) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pidx, orderId);

  /// Create a copy of VerifyKhaltiEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pidx, int orderId) verify,
  }) {
    return verify(pidx, orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pidx, int orderId)? verify,
  }) {
    return verify?.call(pidx, orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pidx, int orderId)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(pidx, orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Verify value) verify,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Verify value)? verify,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Verify value)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements VerifyKhaltiEvent {
  const factory _Verify({
    required final String pidx,
    required final int orderId,
  }) = _$VerifyImpl;

  @override
  String get pidx;
  @override
  int get orderId;

  /// Create a copy of VerifyKhaltiEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
