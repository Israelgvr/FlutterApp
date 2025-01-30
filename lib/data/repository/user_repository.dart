import '../../domain/entities/user_entity.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<bool> registerUser(UserEntity user) async {
    try {
      final response = await apiService.post("registrarse", user.toJson());
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception("Error during registration: $e");
    }
  }



}
