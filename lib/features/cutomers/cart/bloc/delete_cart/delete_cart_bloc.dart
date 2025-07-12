import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/cart_model.dart';

part 'delete_cart_event.dart';
part 'delete_cart_state.dart';
part 'delete_cart_bloc.freezed.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  final CartRepository _cartRepository;
  DeleteCartBloc({required CartRepository repo})
    : _cartRepository = repo,
      super(DeleteCartState.initial()) {
    on<_DeleteCart>(_onDeleteCart);
  }

  Future<void> _onDeleteCart(
    _DeleteCart event,
    Emitter<DeleteCartState> emit,
  ) async {
    emit(DeleteCartState.loading());

    final result = await _cartRepository.deleteCart();
    result.fold(
      (failure) => emit(DeleteCartState.failure(failure)),
      (deleteCart) => emit(DeleteCartState.loaded(deleteCart)),
    );
  }
}
