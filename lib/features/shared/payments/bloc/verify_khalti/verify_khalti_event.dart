part of 'verify_khalti_bloc.dart';

@freezed
class VerifyKhaltiEvent with _$VerifyKhaltiEvent {
  const factory VerifyKhaltiEvent.verify({
    required String pidx,
    required int orderId,
  }) = _Verify;
}
