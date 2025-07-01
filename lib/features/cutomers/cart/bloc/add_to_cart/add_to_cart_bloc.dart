import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';
part '../bloc/add_to_cart_bloc.freezed.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(_Initial()) {
    on<AddToCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
