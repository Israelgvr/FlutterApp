import '../entities/user_entity.dart';
import '../../data/repository/user_repository.dart';

class RegisterUserUseCase {
  final UserRepository repository;

  RegisterUserUseCase(this.repository);

  Future<bool> execute(UserEntity user) async {
    return await repository.registerUser(user);
  }
}
