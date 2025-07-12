part of 'shipping_options_bloc.dart';

@freezed
class ShippingOptionsEvent with _$ShippingOptionsEvent {
  const factory ShippingOptionsEvent.shippingOptions() = _ShippingOptions;
}