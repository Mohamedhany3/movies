import 'User.dart';

class RegisterResponse {
  const RegisterResponse({required this.message, required this.user});

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
  final String? message;
  final User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
