part of 'customer_sign_up_bloc.dart';

@freezed
abstract class CustomerSignUpEvent with _$CustomerSignUpEvent {
  const factory CustomerSignUpEvent.customerSignUp(
    CustomerRegisterModel customerRegisterModel,
  ) = _CustomerSignUp;
}
