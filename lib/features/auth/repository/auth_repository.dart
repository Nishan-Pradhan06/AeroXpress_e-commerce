import 'package:dartz/dartz.dart';
import 'package:deal_sell/common/typedef/either_type.dart';
import 'package:deal_sell/core/network/api_services.dart';
import 'package:deal_sell/features/auth/model/customer_register_model.dart';
import 'package:deal_sell/features/auth/model/user_login_model.dart';
import '../../../core/services/cache_services.dart';

//##-------------------AUTH REPOSITORY-------------------------##
abstract interface class AuthRepository {
  //##-------------------CUSTOMER REGISTER-------------------------##
  FutureEither<String> signUp({
    required CustomerRegisterModel customerRegisterModel,
  });

  //##-------------------USER SIGN IN-------------------------##
  FutureEither<String> signIn({required UserLoginModel userLoginModel});

  //##-------------------SIGN OUT------------------------##
  FutureEither<String> signOut();
}

//##-------------------AUTH REPOSITORY IMPLEMENTATION-------------------------##
class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  //##-------------------USER SIGN IN-------------------------##
  @override
  FutureEither<String> signIn({required UserLoginModel userLoginModel}) async {
    final response = await _apiService.post<Map>(
      'auth/login',
      data: {...userLoginModel.toMap()},
    );

    return response.fold((failure) => Left(failure), (data) async {
      await CacheServices.instance.setAuthToken(data['token']);
      return Right('Login Successful');
    });
  }

  //##-------------------CUSTOMER REGISTER-------------------------##
  @override
  FutureEither<String> signUp({
    required CustomerRegisterModel customerRegisterModel,
  }) async {
    final response = await _apiService.post(
      'auth/register',
      data: {...customerRegisterModel.toMap()},
    );
    return await response.fold((failure) => Left(failure), (data) async {
      await CacheServices.instance.setAuthToken(data['token']);
      return Right("Register Successful !!!");
    });
  }

  //##-------------------SIGN OUT------------------------##
  @override
  FutureEither<String> signOut() {
    // Sign-out not implemented yet
    throw UnimplementedError();
  }
}
