import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/useCase/register_user_use_case.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error);
}

class RegisterBloc extends Cubit<RegisterState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterBloc(this.registerUserUseCase) : super(RegisterInitial());

  Future<void> register(UserEntity user) async {
    emit(RegisterLoading());
    try {
      final success = await registerUserUseCase.execute(user);
      if (success) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure("Registration failed"));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
