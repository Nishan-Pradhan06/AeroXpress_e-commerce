import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_orders_event.dart';
part 'vendor_orders_state.dart';
part '../../../../cutomers/orders/bloc/bloc/vendor_orders_bloc.freezed.dart';

class VendorOrdersBloc extends Bloc<VendorOrdersEvent, VendorOrdersState> {
  VendorOrdersBloc() : super(_Initial()) {
    on<VendorOrdersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
