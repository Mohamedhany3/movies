import 'package:movie/features/auth/data/models/User.dart';

class LoginResponse {
  LoginResponse({required this.message, required this.user});
  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
  final String message;
  final User user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['user'] = user;
    return map;
  }
}
