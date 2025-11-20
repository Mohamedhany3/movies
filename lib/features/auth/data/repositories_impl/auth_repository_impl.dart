import 'package:movie/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/data/models/RegisterResponse.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authApiRemoteDataSource;
  AuthRepositoryImpl({required this.authApiRemoteDataSource});
  @override
  Future<RegisterResponse> register(RegisterRequest request) {
    return authApiRemoteDataSource.register(request);
  }
}
