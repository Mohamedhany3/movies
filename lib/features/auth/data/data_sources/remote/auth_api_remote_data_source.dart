import 'package:dio/dio.dart';
import 'package:movie/core/errors/app_exceptions.dart';
import 'package:movie/core/recources/costants_manager.dart';
import 'package:movie/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movie/features/auth/data/models/LoginRequest.dart';
import 'package:movie/features/auth/data/models/LoginResponse.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/data/models/RegisterResponse.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.registerEndPoint,
        data: request.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to Register");
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.loginEndPoint,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        return message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed to Login");
    }
  }
}
