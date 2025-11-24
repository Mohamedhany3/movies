import 'package:dartz/dartz.dart';
import 'package:movie/core/errors/app_exceptions.dart';
import 'package:movie/core/errors/failure.dart';
import 'package:movie/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:movie/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movie/features/auth/data/models/LoginRequest.dart';
import 'package:movie/features/auth/data/models/LoginResponse.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/data/models/RegisterResponse.dart';
import 'package:movie/features/auth/data/models/User.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authApiRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({
    required this.authApiRemoteDataSource,
    required this.authLocalDataSource,
  });
  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await authApiRemoteDataSource.register(request);
      await authLocalDataSource.saveId(response.user.id);
      return Right(response.user);
    } on AppExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest request) async {
    try {
      final response = await authApiRemoteDataSource.login(request);
      await authLocalDataSource.saveId(response.user.id);
      return Right(response.user);
    } on AppExceptions catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
