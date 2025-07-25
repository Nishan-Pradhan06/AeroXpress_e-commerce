import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/shared/orders/repository/orders_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'khalti_payment_initiate_event.dart';
part 'khalti_payment_initiate_state.dart';
part 'khalti_payment_initiate_bloc.freezed.dart';

class KhaltiPaymenetInitiateBloc
    extends Bloc<KhaltiPaymenetInitiateEvent, KhaltiPaymenetInitiateState> {
  final OrderRepository _orderRepository;
  KhaltiPaymenetInitiateBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(BaseState.initial()) {
    on<_Initiate>(_onInitiate);
 
  }

  Future<void> _onInitiate(
    _Initiate event,
    Emitter<KhaltiPaymenetInitiateState> emit,
  ) async {
    emit(BaseState.loading());

    final result = await _orderRepository.khaltiInitiate(event.orderId);

    result.fold(
      (failure) => emit(BaseState.failure(failure)),
      (url) => emit(
        BaseState.loaded(
          KhaltiPaymentState(khaltiUrl: url, pidx: extractPidxFromUrl(url)),
        ),
      ),
    );
  }

 
  String extractPidxFromUrl(String paymentUrl) {
    final uri = Uri.parse(paymentUrl);
    return uri.queryParameters['pidx'] ?? '';
  }
}
