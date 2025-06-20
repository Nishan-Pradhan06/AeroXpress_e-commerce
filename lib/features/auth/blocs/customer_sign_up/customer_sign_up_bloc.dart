import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_sign_up_event.dart';
part 'customer_sign_up_state.dart';
part '../bloc/customer_sign_up_bloc.freezed.dart';

class CustomerSignUpBloc extends Bloc<CustomerSignUpEvent, CustomerSignUpState> {
  CustomerSignUpBloc() : super(_Initial()) {
    on<CustomerSignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
