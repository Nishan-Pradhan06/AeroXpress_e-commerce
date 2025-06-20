// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CustomerSignUpEvent {
  CustomerRegisterModel get customerRegisterModel =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerRegisterModel customerRegisterModel)
    customerSignUp,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerRegisterModel customerRegisterModel)?
    customerSignUp,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerRegisterModel customerRegisterModel)?
    customerSignUp,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerSignUp value) customerSignUp,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerSignUp value)? customerSignUp,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerSignUp value)? customerSignUp,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSignUpEventCopyWith<CustomerSignUpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSignUpEventCopyWith<$Res> {
  factory $CustomerSignUpEventCopyWith(
    CustomerSignUpEvent value,
    $Res Function(CustomerSignUpEvent) then,
  ) = _$CustomerSignUpEventCopyWithImpl<$Res, CustomerSignUpEvent>;
  @useResult
  $Res call({CustomerRegisterModel customerRegisterModel});
}

/// @nodoc
class _$CustomerSignUpEventCopyWithImpl<$Res, $Val extends CustomerSignUpEvent>
    implements $CustomerSignUpEventCopyWith<$Res> {
  _$CustomerSignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customerRegisterModel = null}) {
    return _then(
      _value.copyWith(
            customerRegisterModel:
                null == customerRegisterModel
                    ? _value.customerRegisterModel
                    : customerRegisterModel // ignore: cast_nullable_to_non_nullable
                        as CustomerRegisterModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerSignUpImplCopyWith<$Res>
    implements $CustomerSignUpEventCopyWith<$Res> {
  factory _$$CustomerSignUpImplCopyWith(
    _$CustomerSignUpImpl value,
    $Res Function(_$CustomerSignUpImpl) then,
  ) = __$$CustomerSignUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomerRegisterModel customerRegisterModel});
}

/// @nodoc
class __$$CustomerSignUpImplCopyWithImpl<$Res>
    extends _$CustomerSignUpEventCopyWithImpl<$Res, _$CustomerSignUpImpl>
    implements _$$CustomerSignUpImplCopyWith<$Res> {
  __$$CustomerSignUpImplCopyWithImpl(
    _$CustomerSignUpImpl _value,
    $Res Function(_$CustomerSignUpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerSignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? customerRegisterModel = null}) {
    return _then(
      _$CustomerSignUpImpl(
        null == customerRegisterModel
            ? _value.customerRegisterModel
            : customerRegisterModel // ignore: cast_nullable_to_non_nullable
                as CustomerRegisterModel,
      ),
    );
  }
}

/// @nodoc

class _$CustomerSignUpImpl implements _CustomerSignUp {
  const _$CustomerSignUpImpl(this.customerRegisterModel);

  @override
  final CustomerRegisterModel customerRegisterModel;

  @override
  String toString() {
    return 'CustomerSignUpEvent.customerSignUp(customerRegisterModel: $customerRegisterModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSignUpImpl &&
            (identical(other.customerRegisterModel, customerRegisterModel) ||
                other.customerRegisterModel == customerRegisterModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerRegisterModel);

  /// Create a copy of CustomerSignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSignUpImplCopyWith<_$CustomerSignUpImpl> get copyWith =>
      __$$CustomerSignUpImplCopyWithImpl<_$CustomerSignUpImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerRegisterModel customerRegisterModel)
    customerSignUp,
  }) {
    return customerSignUp(customerRegisterModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerRegisterModel customerRegisterModel)?
    customerSignUp,
  }) {
    return customerSignUp?.call(customerRegisterModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerRegisterModel customerRegisterModel)?
    customerSignUp,
    required TResult orElse(),
  }) {
    if (customerSignUp != null) {
      return customerSignUp(customerRegisterModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CustomerSignUp value) customerSignUp,
  }) {
    return customerSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CustomerSignUp value)? customerSignUp,
  }) {
    return customerSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CustomerSignUp value)? customerSignUp,
    required TResult orElse(),
  }) {
    if (customerSignUp != null) {
      return customerSignUp(this);
    }
    return orElse();
  }
}

abstract class _CustomerSignUp implements CustomerSignUpEvent {
  const factory _CustomerSignUp(
    final CustomerRegisterModel customerRegisterModel,
  ) = _$CustomerSignUpImpl;

  @override
  CustomerRegisterModel get customerRegisterModel;

  /// Create a copy of CustomerSignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSignUpImplCopyWith<_$CustomerSignUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
