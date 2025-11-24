abstract class AuthLocalDataSource {
  Future<void> saveId(String id);
  Future<String> getId();
}
