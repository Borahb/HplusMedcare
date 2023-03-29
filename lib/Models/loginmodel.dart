import 'dart:convert';

class LoginResponseModel {
  final String token;
  LoginResponseModel({
    required this.token,
  });

  LoginResponseModel copyWith({
    String? token,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) => LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponseModel(token: $token)';

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}