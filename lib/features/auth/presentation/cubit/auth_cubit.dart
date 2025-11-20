import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/auth/data/models/RegisterRequest.dart';
import 'package:movie/features/auth/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(InitialState());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    try {
      emit(LoadingState());
      var response = await authRepository.register(request);
      emit(SuccessState());
    } catch (exception) {
      emit(ErrorState(message: exception.toString()));
    }
  }
}

abstract class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  String message;
  ErrorState({required this.message});
}

class SuccessState extends AuthState {}
