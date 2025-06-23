import 'package:deal_sell/core/state/bloc_base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/user_profile_model.dart';
import '../repository/my_profile_repository.dart';

part 'get_user_profile_event.dart';
part 'get_user_profile_state.dart';
part 'get_user_profile_bloc.freezed.dart';

class GetUserProfileBloc
    extends Bloc<GetUserProfileEvent, GetUserProfileState> {
  final MyProfileRepository _myProfileRepository;

  GetUserProfileBloc({required MyProfileRepository repo})
    : _myProfileRepository = repo,
      super(GetUserProfileState.initial()) {
    on<_GetUserProfile>(_onGetUserProfile);
  }

  Future<void> _onGetUserProfile(
    _GetUserProfile event,
    Emitter<GetUserProfileState> emit,
  ) async {
    emit(GetUserProfileState.loading());

    final result = await _myProfileRepository.getMe();

    result.fold(
      (failure) => emit(GetUserProfileState.failure(failure)),
      (userProfileData) => emit(GetUserProfileState.loaded(userProfileData)),
    );
  }
}
