part of 'user_sign_in_bloc.dart';

@freezed
class UserSignInEvent with _$UserSignInEvent {
  const factory UserSignInEvent.started() = _Started;
}