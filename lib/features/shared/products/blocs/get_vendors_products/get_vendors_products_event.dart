part of 'get_vendors_products_bloc.dart';

@freezed
class GetVendorsProductsEvent with _$GetVendorsProductsEvent {
  const factory GetVendorsProductsEvent.getVendorProducts() = _GetVendorProducts;
}