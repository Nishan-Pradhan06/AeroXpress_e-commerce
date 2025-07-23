part of 'update_vendor_order_status_bloc.dart';

@freezed
class UpdateVendorOrderStatusEvent with _$UpdateVendorOrderStatusEvent {
  const factory UpdateVendorOrderStatusEvent.updateVendorOrderStatus({
    required int orderId,
    required String status,
  }) = _UpdateVendorOrderStatus;
}
