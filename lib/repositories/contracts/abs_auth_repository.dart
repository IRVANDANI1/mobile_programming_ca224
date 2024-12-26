import 'package:mobile_programming_ca224/models/user.dart';

abstract class AbsAuthRepository {
  Future<(bool, String)> login(UserLoginDto dataLogin);
  Future<(bool, String)> register(UserRegisterDto dataRegister);
  Future<(bool, String)> forgotPassword(String username);
  Future<bool> refreshToken();
  Future<User?> info();
  Future logout();
  Future<bool> isAuthenticated();
}
