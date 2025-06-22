import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/auth/model/customer_register_model.dart';
import 'package:deal_sell/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_sign_up_event.dart';
part 'customer_sign_up_state.dart';
part 'customer_sign_up_bloc.freezed.dart';

//##-------------------CUSTOMER SIGN UP BLOC-------------------------##
class CustomerSignUpBloc
    extends Bloc<CustomerSignUpEvent, CustomerSignUpState> {
  final AuthRepository _authRepository;

  //##-------------------CONSTRUCTOR-------------------------##
  CustomerSignUpBloc({required AuthRepository repo})
    : _authRepository = repo,
      super(CustomerSignUpState.initial()) {
    // Register event handler
    on<_CustomerSignUp>(_onCustomerSignUp);
  }

  //##-------------------HANDLE CUSTOMER SIGN UP-------------------------##
  Future<void> _onCustomerSignUp(
    _CustomerSignUp event,
    Emitter<CustomerSignUpState> emit,
  ) async {
    // Emit loading state before API call
    emit(CustomerSignUpState.loading());

    // // Call signUp method from repository
    final result = await _authRepository.signUp(
      customerRegisterModel: event.customerRegisterModel,
    );

    // Emit either failure or success state based on result
    result.fold(
      (failure) => emit(CustomerSignUpState.failure(failure)),
      (data) => emit(CustomerSignUpState.loaded(data)),
    );
  }
}
