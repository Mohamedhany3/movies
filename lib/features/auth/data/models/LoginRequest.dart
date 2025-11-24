class LoginRequest {
  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(dynamic json) {
    return LoginRequest(email: json['email'], password: json['password']);
  }
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
