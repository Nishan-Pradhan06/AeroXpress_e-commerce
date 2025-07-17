part of 'vendor_orders_bloc.dart';

@freezed
class VendorOrdersEvent with _$VendorOrdersEvent {
  const factory VendorOrdersEvent.getVendorOrders() = _VendorOrders;
}