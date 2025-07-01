import 'package:dartz/dartz.dart';
import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/cart_model.dart';

part 'get_cart_event.dart';
part 'get_cart_state.dart';
part 'get_cart_bloc.freezed.dart';

class GetCartBloc extends Bloc<GetCartEvent, GetCartState> {
  final CartRepository _cartRepository;
  GetCartBloc({required CartRepository repo})
    : _cartRepository = repo,
      super(GetCartState.initial()) {
    on<_GetCart>(_onGetCart);
  }

  Future<void> _onGetCart(_GetCart event, Emitter<GetCartState> emit) async {
    emit(GetCartState.loading());

    final result = await _cartRepository.getCart();

    result.fold((failure) => Left(GetCartState.failure(failure)), (data) {
      emit(GetCartState.loaded(data));
    });
  }
}
