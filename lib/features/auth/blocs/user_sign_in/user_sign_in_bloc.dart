import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sign_in_event.dart';
part 'user_sign_in_state.dart';
part '../bloc/user_sign_in_bloc.freezed.dart';

class UserSignInBloc extends Bloc<UserSignInEvent, UserSignInState> {
  UserSignInBloc() : super(_Initial()) {
    on<UserSignInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
