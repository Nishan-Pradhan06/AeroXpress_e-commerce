// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DeleteCartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleteCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleteCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleteCart,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteCart value) deleteCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteCart value)? deleteCart,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteCart value)? deleteCart,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteCartEventCopyWith<$Res> {
  factory $DeleteCartEventCopyWith(
    DeleteCartEvent value,
    $Res Function(DeleteCartEvent) then,
  ) = _$DeleteCartEventCopyWithImpl<$Res, DeleteCartEvent>;
}

/// @nodoc
class _$DeleteCartEventCopyWithImpl<$Res, $Val extends DeleteCartEvent>
    implements $DeleteCartEventCopyWith<$Res> {
  _$DeleteCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteCartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DeleteCartImplCopyWith<$Res> {
  factory _$$DeleteCartImplCopyWith(
    _$DeleteCartImpl value,
    $Res Function(_$DeleteCartImpl) then,
  ) = __$$DeleteCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteCartImplCopyWithImpl<$Res>
    extends _$DeleteCartEventCopyWithImpl<$Res, _$DeleteCartImpl>
    implements _$$DeleteCartImplCopyWith<$Res> {
  __$$DeleteCartImplCopyWithImpl(
    _$DeleteCartImpl _value,
    $Res Function(_$DeleteCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeleteCartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteCartImpl implements _DeleteCart {
  const _$DeleteCartImpl();

  @override
  String toString() {
    return 'DeleteCartEvent.deleteCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deleteCart,
  }) {
    return deleteCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? deleteCart,
  }) {
    return deleteCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deleteCart,
    required TResult orElse(),
  }) {
    if (deleteCart != null) {
      return deleteCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeleteCart value) deleteCart,
  }) {
    return deleteCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeleteCart value)? deleteCart,
  }) {
    return deleteCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeleteCart value)? deleteCart,
    required TResult orElse(),
  }) {
    if (deleteCart != null) {
      return deleteCart(this);
    }
    return orElse();
  }
}

abstract class _DeleteCart implements DeleteCartEvent {
  const factory _DeleteCart() = _$DeleteCartImpl;
}
