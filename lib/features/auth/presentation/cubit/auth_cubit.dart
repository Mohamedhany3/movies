import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/auth/data/models/LoginRequest.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(InitialState());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    try {
      emit(RegisterLoadingState());
      var response = await authRepository.register(request);
      emit(RegisterSuccessState());
    } catch (exception) {
      emit(RegisterErrorState(message: exception.toString()));
    }
  }

  void login(LoginRequest request) async {
    try {
      emit(LoginLoadingState());
      var response = await authRepository.login(request);
      emit(LoginSuccessState());
    } catch (exception) {
      emit(LoginErrorState(message: exception.toString()));
    }
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
