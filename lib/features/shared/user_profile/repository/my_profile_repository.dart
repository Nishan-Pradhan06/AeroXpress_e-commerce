import 'package:dartz/dartz.dart';
import 'package:deal_sell/core/network/api_services.dart';
import '../../../../common/typedef/either_type.dart';
import '../models/user_profile_model.dart';

//##-------------------MY PROFILE REPOSITORY-------------------------##
abstract interface class MyProfileRepository {
  //##-------------------GET USER PROFILE-------------------------##
  FutureEither<String> getMe({required UserProfileModel userProfileModel});
}

class MyProfileRepositoryImpl implements MyProfileRepository {
  final ApiService _apiService;

  MyProfileRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------GET USER PROFILE-------------------------##
  @override
  FutureEither<String> getMe({
    required UserProfileModel userProfileModel,
  }) async {
    final response = await _apiService.get<String>('auth/me');

    return response.fold((failure) => Left(failure), (data) => Right(data));
  }
}
