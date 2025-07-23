import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/shared/products/repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/products_model.dart';

part 'get_product_by_slug_event.dart';
part 'get_product_by_slug_state.dart';
part 'get_product_by_slug_bloc.freezed.dart';

class GetProductBySlugBloc
    extends Bloc<GetProductBySlugEvent, GetProductBySlugState> {
  final ProductsRepository _productsRepository;

  GetProductBySlugBloc({required ProductsRepository repo})
    : _productsRepository = repo,
      super(GetProductBySlugState.initial()) {
    on<_GetProdyctBySlug>(_onGetProductBySlug);
  }

  Future<void> _onGetProductBySlug(
    _GetProdyctBySlug event,
    Emitter<GetProductBySlugState> emit,
  ) async {
    emit(GetProductBySlugState.loading());

    final productBySlug = await _productsRepository.getProductBySlug(
      slug: event.productSlug,
    );

    productBySlug.fold(
      (failure) => emit(GetProductBySlugState.failure(failure)),
      (product) => emit(GetProductBySlugState.loaded(product)),
    );
  }
}
