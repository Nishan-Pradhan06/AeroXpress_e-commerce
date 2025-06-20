import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:deal_sell/features/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/user_login_model.dart';

part 'user_sign_in_event.dart';
part 'user_sign_in_state.dart';
part 'user_sign_in_bloc.freezed.dart';

//##-------------------USER SIGN IN BLOC-------------------------##
class UserSignInBloc extends Bloc<UserSignInEvent, UserSignInState> {
  final AuthRepository _authRepository;

  //##-------------------CONSTRUCTOR-------------------------##
  UserSignInBloc({required AuthRepository repo})
    : _authRepository = repo,
      super(UserSignInState.initial()) {
    // Register event handler
    on<_UserSignIn>(_onUserSignIn);
  }

  //##-------------------HANDLE USER SIGN IN-------------------------##
  Future<void> _onUserSignIn(
    _UserSignIn event,
    Emitter<UserSignInState> emit,
  ) async {
    // Emit loading state
    emit(UserSignInState.loading());

    // Call signIn method from repository
    final result = await _authRepository.signIn(
      userLoginModel: event.userLoginModel,
    );

    // Emit either failure or loaded state based on result
    result.fold(
      (failure) => emit(UserSignInState.failure(failure)),
      (data) => emit(UserSignInState.loaded(data)),
    );
  }
}
