import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/cart/models/shipping_option_model.dart';
import 'package:deal_sell/features/cutomers/cart/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_options_event.dart';
part 'shipping_options_state.dart';
part 'shipping_options_bloc.freezed.dart';

class ShippingOptionsBloc
    extends Bloc<ShippingOptionsEvent, ShippingOptionsState> {
  final CartRepository _cartRepository;
  ShippingOptionsBloc({required CartRepository repo})
    : _cartRepository = repo,
      super(ShippingOptionsState.initial()) {
    on<_ShippingOptions>(_onShippingOptions);
  }

  Future<void> _onShippingOptions(
    _ShippingOptions event,
    Emitter<ShippingOptionsState> emit,
  ) async {
    emit(ShippingOptionsState.loading());

    final result = await _cartRepository.getShippingOptions();
    result.fold(
      (failure) => emit(ShippingOptionsState.failure(failure)),
      (shippingOptions) => emit(ShippingOptionsState.loaded(shippingOptions)),
    );
  }
}
