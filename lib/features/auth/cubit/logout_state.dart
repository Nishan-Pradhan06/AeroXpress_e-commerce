part of 'logout_cubit.dart';

class LogoutState extends Equatable {
  final String? status;
  const LogoutState({this.status});
  @override
  List<Object?> get props => [status];
}
