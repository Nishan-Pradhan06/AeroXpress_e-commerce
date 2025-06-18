part of 'my_profile_bloc.dart';

sealed class MyProfileState extends Equatable {
  const MyProfileState();
  
  @override
  List<Object> get props => [];
}

final class MyProfileInitial extends MyProfileState {}
