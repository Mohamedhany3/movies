class User {
  const User({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avatarId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(dynamic json) {
    return User(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
      avatarId: json['avatarId'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avatarId;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avatarId'] = avatarId;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
