import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/shared/products/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  ProductsBloc({required ProductsRepository repo})
    : _productsRepository = repo,
      super(ProductsState.initial()) {
    on<_Products>(_onGetAllProducts);
  }

  Future<void> _onGetAllProducts(
    _Products event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsState.loading());

    final products = await _productsRepository.getAllProducts();

    products.fold((failure) => emit(ProductsState.failure(failure)), (data) {
      emit(ProductsState.loaded(data));
    });
  }
}
