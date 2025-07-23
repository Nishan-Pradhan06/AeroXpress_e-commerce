// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_vendor_order_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UpdateVendorOrderStatusEvent {
  int get orderId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int orderId, String status)
    updateVendorOrderStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int orderId, String status)? updateVendorOrderStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int orderId, String status)? updateVendorOrderStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateVendorOrderStatus value)
    updateVendorOrderStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateVendorOrderStatus value)? updateVendorOrderStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateVendorOrderStatus value)? updateVendorOrderStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of UpdateVendorOrderStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateVendorOrderStatusEventCopyWith<UpdateVendorOrderStatusEvent>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateVendorOrderStatusEventCopyWith<$Res> {
  factory $UpdateVendorOrderStatusEventCopyWith(
    UpdateVendorOrderStatusEvent value,
    $Res Function(UpdateVendorOrderStatusEvent) then,
  ) =
      _$UpdateVendorOrderStatusEventCopyWithImpl<
        $Res,
        UpdateVendorOrderStatusEvent
      >;
  @useResult
  $Res call({int orderId, String status});
}

/// @nodoc
class _$UpdateVendorOrderStatusEventCopyWithImpl<
  $Res,
  $Val extends UpdateVendorOrderStatusEvent
>
    implements $UpdateVendorOrderStatusEventCopyWith<$Res> {
  _$UpdateVendorOrderStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateVendorOrderStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? status = null}) {
    return _then(
      _value.copyWith(
            orderId:
                null == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as int,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateVendorOrderStatusImplCopyWith<$Res>
    implements $UpdateVendorOrderStatusEventCopyWith<$Res> {
  factory _$$UpdateVendorOrderStatusImplCopyWith(
    _$UpdateVendorOrderStatusImpl value,
    $Res Function(_$UpdateVendorOrderStatusImpl) then,
  ) = __$$UpdateVendorOrderStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int orderId, String status});
}

/// @nodoc
class __$$UpdateVendorOrderStatusImplCopyWithImpl<$Res>
    extends
        _$UpdateVendorOrderStatusEventCopyWithImpl<
          $Res,
          _$UpdateVendorOrderStatusImpl
        >
    implements _$$UpdateVendorOrderStatusImplCopyWith<$Res> {
  __$$UpdateVendorOrderStatusImplCopyWithImpl(
    _$UpdateVendorOrderStatusImpl _value,
    $Res Function(_$UpdateVendorOrderStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateVendorOrderStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? status = null}) {
    return _then(
      _$UpdateVendorOrderStatusImpl(
        orderId:
            null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as int,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateVendorOrderStatusImpl implements _UpdateVendorOrderStatus {
  const _$UpdateVendorOrderStatusImpl({
    required this.orderId,
    required this.status,
  });

  @override
  final int orderId;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateVendorOrderStatusEvent.updateVendorOrderStatus(orderId: $orderId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateVendorOrderStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, status);

  /// Create a copy of UpdateVendorOrderStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateVendorOrderStatusImplCopyWith<_$UpdateVendorOrderStatusImpl>
  get copyWith => __$$UpdateVendorOrderStatusImplCopyWithImpl<
    _$UpdateVendorOrderStatusImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int orderId, String status)
    updateVendorOrderStatus,
  }) {
    return updateVendorOrderStatus(orderId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int orderId, String status)? updateVendorOrderStatus,
  }) {
    return updateVendorOrderStatus?.call(orderId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int orderId, String status)? updateVendorOrderStatus,
    required TResult orElse(),
  }) {
    if (updateVendorOrderStatus != null) {
      return updateVendorOrderStatus(orderId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateVendorOrderStatus value)
    updateVendorOrderStatus,
  }) {
    return updateVendorOrderStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateVendorOrderStatus value)? updateVendorOrderStatus,
  }) {
    return updateVendorOrderStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateVendorOrderStatus value)? updateVendorOrderStatus,
    required TResult orElse(),
  }) {
    if (updateVendorOrderStatus != null) {
      return updateVendorOrderStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateVendorOrderStatus
    implements UpdateVendorOrderStatusEvent {
  const factory _UpdateVendorOrderStatus({
    required final int orderId,
    required final String status,
  }) = _$UpdateVendorOrderStatusImpl;

  @override
  int get orderId;
  @override
  String get status;

  /// Create a copy of UpdateVendorOrderStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateVendorOrderStatusImplCopyWith<_$UpdateVendorOrderStatusImpl>
  get copyWith => throw _privateConstructorUsedError;
}
