import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/cutomers/category/repository/category_repository.dart';
import 'package:deal_sell/features/cutomers/products/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc({required CategoryRepository repo})
    : _categoryRepository = repo,
      super(CategoryState.initial()) {
    on<_GetCategory>(_onGetCategory);
  }

  Future<void> _onGetCategory(
    _GetCategory event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryState.loading());

    final categories = await _categoryRepository.getAllCategories();

    categories.fold(
      (failure) => emit(CategoryState.failure(failure)),
      (data) => emit(CategoryState.loaded(data)),
    );
  }
}
