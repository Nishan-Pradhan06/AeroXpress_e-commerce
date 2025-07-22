part of 'khalti_paymenet_initiate_bloc.dart';

@freezed
abstract class KhaltiPaymenetInitiateEvent with _$KhaltiPaymenetInitiateEvent {
  const factory KhaltiPaymenetInitiateEvent.initiate(int orderId) = _Initiate;
}
