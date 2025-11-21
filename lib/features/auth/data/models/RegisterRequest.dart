class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avaterId,
  });

  factory RegisterRequest.fromJson(dynamic json) {
    return RegisterRequest(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
      phone: json['phone'],
      avaterId: json['avaterId'],
    );
  }
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? phone;
  final int? avaterId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    return map;
  }
}
