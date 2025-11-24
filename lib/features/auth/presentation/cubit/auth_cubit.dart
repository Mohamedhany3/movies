import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/auth/data/models/LoginRequest.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(InitialState());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    emit(RegisterLoadingState());
    final result = await authRepository.register(request);
    result.fold(
      (failure) {
        emit(RegisterErrorState(message: failure.message));
      },
      (user) {
        emit(RegisterSuccessState());
      },
    );
  }

  void login(LoginRequest request) async {
    emit(LoginLoadingState());
    final result = await authRepository.login(request);
    result.fold(
      (failure) {
        emit(LoginErrorState(message: failure.message));
      },
      (user) {
        emit(LoginSuccessState());
      },
    );
  }
}

abstract class AuthState {}

class InitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  String message;
  RegisterErrorState({required this.message});
}

class RegisterSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  String message;
  LoginErrorState({required this.message});
}

class LoginSuccessState extends AuthState {}
