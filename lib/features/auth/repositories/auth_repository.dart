import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/data/models/RegisterResponse.dart';

abstract class AuthRepository {
  Future<RegisterResponse> register(RegisterRequest request);
}
