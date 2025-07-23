import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/vendor_product_model.dart';
import '../../repository/products_repository.dart';

part 'get_vendors_products_event.dart';
part 'get_vendors_products_state.dart';
part 'get_vendors_products_bloc.freezed.dart';

class GetVendorsProductsBloc
    extends Bloc<GetVendorsProductsEvent, GetVendorsProductsState> {
  final ProductsRepository _productsRepository;
  GetVendorsProductsBloc({required ProductsRepository repo})
    : _productsRepository = repo,
      super(GetVendorsProductsState.initial()) {
    on<_GetVendorProducts>(_onGetVendorProducts);
  }

  Future<void> _onGetVendorProducts(
    _GetVendorProducts event,
    Emitter<GetVendorsProductsState> emit,
  ) async {
    emit(GetVendorsProductsState.loading());

    final products = await _productsRepository.getVendorProducts();

    products.fold(
      (failure) => emit(GetVendorsProductsState.failure(failure)),
      (data) => emit(GetVendorsProductsState.loaded(data)),
    );
  }
}
