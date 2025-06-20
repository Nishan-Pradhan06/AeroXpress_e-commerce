// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserSignInEvent {
  UserLoginModel get userLoginModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLoginModel userLoginModel) userSiginIn,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserLoginModel userLoginModel)? userSiginIn,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLoginModel userLoginModel)? userSiginIn,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserSignIn value) userSiginIn,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserSignIn value)? userSiginIn,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserSignIn value)? userSiginIn,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of UserSignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSignInEventCopyWith<UserSignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignInEventCopyWith<$Res> {
  factory $UserSignInEventCopyWith(
    UserSignInEvent value,
    $Res Function(UserSignInEvent) then,
  ) = _$UserSignInEventCopyWithImpl<$Res, UserSignInEvent>;
  @useResult
  $Res call({UserLoginModel userLoginModel});
}

/// @nodoc
class _$UserSignInEventCopyWithImpl<$Res, $Val extends UserSignInEvent>
    implements $UserSignInEventCopyWith<$Res> {
  _$UserSignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userLoginModel = null}) {
    return _then(
      _value.copyWith(
            userLoginModel:
                null == userLoginModel
                    ? _value.userLoginModel
                    : userLoginModel // ignore: cast_nullable_to_non_nullable
                        as UserLoginModel,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSignInImplCopyWith<$Res>
    implements $UserSignInEventCopyWith<$Res> {
  factory _$$UserSignInImplCopyWith(
    _$UserSignInImpl value,
    $Res Function(_$UserSignInImpl) then,
  ) = __$$UserSignInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserLoginModel userLoginModel});
}

/// @nodoc
class __$$UserSignInImplCopyWithImpl<$Res>
    extends _$UserSignInEventCopyWithImpl<$Res, _$UserSignInImpl>
    implements _$$UserSignInImplCopyWith<$Res> {
  __$$UserSignInImplCopyWithImpl(
    _$UserSignInImpl _value,
    $Res Function(_$UserSignInImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userLoginModel = null}) {
    return _then(
      _$UserSignInImpl(
        null == userLoginModel
            ? _value.userLoginModel
            : userLoginModel // ignore: cast_nullable_to_non_nullable
                as UserLoginModel,
      ),
    );
  }
}

/// @nodoc

class _$UserSignInImpl implements _UserSignIn {
  const _$UserSignInImpl(this.userLoginModel);

  @override
  final UserLoginModel userLoginModel;

  @override
  String toString() {
    return 'UserSignInEvent.userSiginIn(userLoginModel: $userLoginModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSignInImpl &&
            (identical(other.userLoginModel, userLoginModel) ||
                other.userLoginModel == userLoginModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userLoginModel);

  /// Create a copy of UserSignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSignInImplCopyWith<_$UserSignInImpl> get copyWith =>
      __$$UserSignInImplCopyWithImpl<_$UserSignInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserLoginModel userLoginModel) userSiginIn,
  }) {
    return userSiginIn(userLoginModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserLoginModel userLoginModel)? userSiginIn,
  }) {
    return userSiginIn?.call(userLoginModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserLoginModel userLoginModel)? userSiginIn,
    required TResult orElse(),
  }) {
    if (userSiginIn != null) {
      return userSiginIn(userLoginModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UserSignIn value) userSiginIn,
  }) {
    return userSiginIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserSignIn value)? userSiginIn,
  }) {
    return userSiginIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserSignIn value)? userSiginIn,
    required TResult orElse(),
  }) {
    if (userSiginIn != null) {
      return userSiginIn(this);
    }
    return orElse();
  }
}

abstract class _UserSignIn implements UserSignInEvent {
  const factory _UserSignIn(final UserLoginModel userLoginModel) =
      _$UserSignInImpl;

  @override
  UserLoginModel get userLoginModel;

  /// Create a copy of UserSignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSignInImplCopyWith<_$UserSignInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
