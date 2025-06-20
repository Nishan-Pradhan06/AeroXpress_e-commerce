part of 'customer_sign_up_bloc.dart';

@freezed
class CustomerSignUpEvent with _$CustomerSignUpEvent {
  const factory CustomerSignUpEvent.started() = _Started;
}