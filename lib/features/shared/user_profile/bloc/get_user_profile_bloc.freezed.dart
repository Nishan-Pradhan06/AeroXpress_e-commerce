// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetUserProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfile value) getUserProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfile value)? getUserProfile,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfile value)? getUserProfile,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserProfileEventCopyWith<$Res> {
  factory $GetUserProfileEventCopyWith(
    GetUserProfileEvent value,
    $Res Function(GetUserProfileEvent) then,
  ) = _$GetUserProfileEventCopyWithImpl<$Res, GetUserProfileEvent>;
}

/// @nodoc
class _$GetUserProfileEventCopyWithImpl<$Res, $Val extends GetUserProfileEvent>
    implements $GetUserProfileEventCopyWith<$Res> {
  _$GetUserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetUserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserProfileImplCopyWith<$Res> {
  factory _$$GetUserProfileImplCopyWith(
    _$GetUserProfileImpl value,
    $Res Function(_$GetUserProfileImpl) then,
  ) = __$$GetUserProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileImplCopyWithImpl<$Res>
    extends _$GetUserProfileEventCopyWithImpl<$Res, _$GetUserProfileImpl>
    implements _$$GetUserProfileImplCopyWith<$Res> {
  __$$GetUserProfileImplCopyWithImpl(
    _$GetUserProfileImpl _value,
    $Res Function(_$GetUserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetUserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserProfileImpl implements _GetUserProfile {
  const _$GetUserProfileImpl();

  @override
  String toString() {
    return 'GetUserProfileEvent.getUserProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserProfile,
  }) {
    return getUserProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfile,
  }) {
    return getUserProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfile,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfile value) getUserProfile,
  }) {
    return getUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfile value)? getUserProfile,
  }) {
    return getUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfile value)? getUserProfile,
    required TResult orElse(),
  }) {
    if (getUserProfile != null) {
      return getUserProfile(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfile implements GetUserProfileEvent {
  const factory _GetUserProfile() = _$GetUserProfileImpl;
}
