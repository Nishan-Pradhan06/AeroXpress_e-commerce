import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../common/error/error_handler.dart';
import '../../common/error/failure.dart';

/// Generic API service for making HTTP requests
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  /// Perform a GET request
  Future<Either<Failure, T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (fromJson != null) {
        return Right(fromJson(response.data));
      } else {
        return Right(response.data as T);
      }
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  /// Perform a POST request
  Future<Either<Failure, T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (fromJson != null) {
        return Right(fromJson(response.data));
      } else {
        return Right(response.data as T);
      }
    } catch (e) {
      log("hello world");
      print("helllosfssssssssssssssssssssssssssssss");
      return Left(ErrorHandler.handleException(e));
    }
  }

  /// Perform a PUT request
  Future<Either<Failure, T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (fromJson != null) {
        return Right(fromJson(response.data));
      } else {
        return Right(response.data as T);
      }
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  /// Perform a DELETE request
  Future<Either<Failure, T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (fromJson != null) {
        return Right(fromJson(response.data));
      } else {
        return Right(response.data as T);
      }
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  /// Perform a PATCH request
  Future<Either<Failure, T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      if (fromJson != null) {
        return Right(fromJson(response.data));
      } else {
        return Right(response.data as T);
      }
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
