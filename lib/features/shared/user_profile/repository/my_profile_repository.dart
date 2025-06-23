import 'package:dartz/dartz.dart';
import 'package:deal_sell/core/network/api_services.dart';
import '../../../../common/typedef/either_type.dart';
import '../models/user_profile_model.dart';

//##-------------------MY PROFILE REPOSITORY-------------------------##
abstract interface class MyProfileRepository {
  //##-------------------GET USER PROFILE-------------------------##
  FutureEither<UserProfileModel> getMe();
}

//##-------------------MY PROFILE REPOSITORY IMPLEMENTATION-------------------------##
class MyProfileRepositoryImpl implements MyProfileRepository {
  final ApiService _apiService;

  //##-------------------CONSTRUCTOR INJECTION-------------------------##
  MyProfileRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------GET USER PROFILE-------------------------##
  @override
  FutureEither<UserProfileModel> getMe() async {
    //##-------------------API CALL TO GET CURRENT USER-------------------------##
    final response = await _apiService.get<Map>('auth/me');

    //##-------------------HANDLE RESPONSE USING EITHER-------------------------##
    return response.fold(
      //##-------------------FAILURE CASE-------------------------##
      (failure) => Left(failure),
      //##-------------------SUCCESS CASE-------------------------##
      (data) {
        //##-------------------EXTRACT USER OBJECT FROM NESTED JSON-------------------------##
        final userJson = data['data']['user'];

        //##-------------------PARSE JSON TO USER PROFILE MODEL-------------------------##
        final user = UserProfileModel.fromJson(userJson);

        //##-------------------RETURN SUCCESSFUL USER PROFILE MODEL-------------------------##
        return Right(user);
      },
    );
  }
}
//##-------------------END OF MY PROFILE REPOSITORY IMPLEMENTATION-------------------------##