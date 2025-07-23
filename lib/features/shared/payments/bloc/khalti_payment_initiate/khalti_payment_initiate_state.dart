// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'khalti_payment_initiate_bloc.dart';

typedef KhaltiPaymenetInitiateState = BaseState<KhaltiPaymentState>;

class KhaltiPaymentState {
  final String khaltiUrl;
  final String pidx;

  KhaltiPaymentState({required this.khaltiUrl, required this.pidx});
}
