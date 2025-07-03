import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/cart/models/cart_model.dart';
import 'package:deal_sell/features/cutomers/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';
part 'add_to_cart_bloc.freezed.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  final CartRepository _cartRepository;
  AddToCartBloc({required CartRepository repo})
    : _cartRepository = repo,
      super(AddToCartState.initial()) {
    on<_AddToCart>(_onAddToCart);
  }

  Future<void> _onAddToCart(
    _AddToCart event,
    Emitter<AddToCartState> emit,
  ) async {
    emit(AddToCartState.loading());

    final result = await _cartRepository.addToCart(
      event.productId,
      event.quantity,
    );

    result.fold(
      (failure) => emit(AddToCartState.failure(failure)),
      (data) => emit(AddToCartState.loaded(data)),
    );
  }
}
