part of 'get_product_by_slug_bloc.dart';

@freezed
class GetProductBySlugEvent with _$GetProductBySlugEvent {
  const factory GetProductBySlugEvent.getProductBySlug({required String productSlug}) = _GetProdyctBySlug;
}