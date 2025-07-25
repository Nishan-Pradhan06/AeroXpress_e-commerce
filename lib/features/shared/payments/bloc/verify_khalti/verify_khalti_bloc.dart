import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/shared/orders/repository/orders_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_khalti_event.dart';
part 'verify_khalti_state.dart';
part 'verify_khalti_bloc.freezed.dart';

class VerifyKhaltiBloc extends Bloc<VerifyKhaltiEvent, VerifyKhaltiState> {
  final OrderRepository _orderRepository;

  VerifyKhaltiBloc({required OrderRepository repo})
    : _orderRepository = repo,
      super(VerifyKhaltiState.initial()) {
    on<_Verify>(_onVerify);
  }

  Future<void> _onVerify(_Verify event, Emitter<VerifyKhaltiState> emit) async {
    emit(BaseState.loading());

    final result = await _orderRepository.verifyKhalti(
      pidx: event.pidx,
      orderId: event.orderId,
    );

    result.fold(
      (failure) => emit(BaseState.failure(failure)),
      (success) => emit(BaseState.loaded(success)),
    );
  }
}
