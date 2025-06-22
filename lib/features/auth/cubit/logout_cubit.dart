import 'package:deal_sell/features/auth/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository _authRepository;

  LogoutCubit({required AuthRepository repo})
    : _authRepository = repo,
      super(const LogoutState());

  Future<void> logout() async {
    emit(const LogoutState(status: 'loading'));

    final result = await _authRepository.signOut();

    result.fold(
      // On failure, emit the failure message
      (failure) => emit(LogoutState(status: failure.message)),
      // On success, emit 'success'
      (message) => emit(const LogoutState(status: 'success')),
    );
  }
}
