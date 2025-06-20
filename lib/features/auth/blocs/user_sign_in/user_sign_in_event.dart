part of 'user_sign_in_bloc.dart';

@freezed
abstract class UserSignInEvent with _$UserSignInEvent {
  const factory UserSignInEvent.userSiginIn(UserLoginModel userLoginModel) =
      _UserSignIn;
}
