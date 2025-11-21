class LoginResponse {
  LoginResponse({required this.message, required this.data});
  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(message: json['message'], data: json['data']);
  }
  final String? message;
  final String? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
